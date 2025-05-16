namespace keepcash.views;
using keepcash.Models;
using keepcash.Data;
using System.Threading.Tasks;
using LiveChartsCore;
using LiveChartsCore.SkiaSharpView;
using LiveChartsCore.SkiaSharpView.Drawing.Geometries;
using System.Collections.ObjectModel;
using LiveChartsCore.SkiaSharpView.Painting;
using SkiaSharp;

public partial class home : ContentPage
{
	private int typeindex { get; set; } = 0;
	private ObservableCollection<TypeData> typeDatas { get; set; }
	public home()
	{
		InitializeComponent();
	}

	private async Task loadUserData()
	{
		if (App.pocketDatabase == null) {
			await DisplayAlert("Error", "Pocket database not initialized", "OK");
			return;
		}

		await App.pocketDatabase.SavePocketDataAsync(new PocketData() {
			PocketName = "Default",
			AmountToKeep = 0
		});
		
		App.pocket = await App.pocketDatabase.GetPocketDataAsync(1);
	}

	protected override async void OnAppearing()
	{
		base.OnAppearing();

		await loadUserData();

		if (App.pocket != null)
		{
			float summary = await App.Database.GetSummary(App.pocket.ID);
			AmountLabel.Text = (summary - App.pocket.AmountToKeep) + " Baht";
			pocketLabel.Text = App.pocket.PocketName.ToString();
			AmountToKeepLabel.Text = App.pocket.AmountToKeep.ToString() + " Baht";

			typeDatas = new ObservableCollection<TypeData>();
			typeDatas.Clear();
			typeDatas.Add(new TypeData() { TypeIndex = 1, TypeName = "Income", TypeColor = Color.FromRgba(229, 164, 74, 255), TypeImage = "otherincome.png", Total = 0 });
			typeDatas.Add(new TypeData() { TypeIndex = 2, TypeName = "Food", TypeColor = Color.FromRgba(86, 154, 87, 255), TypeImage = "food.png", Total = 0 });
			typeDatas.Add(new TypeData() { TypeIndex = 3, TypeName = "Bills", TypeColor = Color.FromRgba(81, 129, 166, 255), TypeImage = "bills.png", Total = 0 });
			typeDatas.Add(new TypeData() { TypeIndex = 4, TypeName = "Education", TypeColor = Color.FromRgba(215, 89, 85, 255), TypeImage = "education.png", Total = 0 });
			typeDatas.Add(new TypeData() { TypeIndex = 5, TypeName = "Health", TypeColor = Color.FromRgba(154, 196, 201, 255), TypeImage = "health.png", Total = 0 });
			typeDatas.Add(new TypeData() { TypeIndex = 6, TypeName = "Personal", TypeColor = Color.FromRgba(61, 140, 130, 255), TypeImage = "personal.png", Total = 0 });
			typeDatas.Add(new TypeData() { TypeIndex = 7, TypeName = "Fare", TypeColor = Color.FromRgba(237, 200, 90, 255), TypeImage = "fare.png", Total = 0 });
			typeDatas.Add(new TypeData() { TypeIndex = 8, TypeName = "Others", TypeColor = Color.FromRgba(172, 85, 147, 255), TypeImage = "others.png", Total = 0 });

			foreach (TypeData item in typeDatas) {
				var total = await App.Database.GetTypeSummary(App.pocket.ID, item.TypeIndex, new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 0, 0, 0, DateTimeKind.Utc));
				item.Total = total;
			}

			var pieSeriesList = new List<ISeries>();
            for (int i = 0; i < typeDatas.Count; i++)
            {

                pieSeriesList.Add(new PieSeries<double>
                {
                    Values = new double[] { typeDatas[i].Total },
                    Name = typeDatas[i].TypeName,
                    Fill = new SolidColorPaint(SKColor.Parse(typeDatas[i].TypeColor.ToHex()))
                });
            }

            PieChart.Series = pieSeriesList.ToArray();
		}
		else
		{
			await DisplayAlert("Error", "Pocket not found", "OK");
		}
	}
	private async void settingbtn_Clicked(object sender, EventArgs e)
	{
   		await Navigation.PushAsync(new setting());
	}

	private async void editpocketbtn_Clicked(object sender, EventArgs e)
	{
   		await Navigation.PushAsync(new editpocket());
	}

	private async void menu1btn_Clicked(object sender, EventArgs e)
	{
		if (Navigation.NavigationStack.LastOrDefault() is home)

		return;

   		await Navigation.PushAsync(new home());
	}

	private async void menu2btn_Clicked(object sender, EventArgs e)
	{
   		await Navigation.PushAsync(new detail());
	}

	private async void menu3btn_Clicked(object sender, EventArgs e)
	{
   		await Navigation.PushAsync(new summarypage());
	}

}