namespace keepcash.views;

using System.Globalization;
using System.Threading.Tasks;
using keepcash.Models;
public partial class category : ContentPage
{
	TypeData typeData { get; set; }
	DateTime selectedDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 0, 0, 0, DateTimeKind.Utc);
	public category()
	{
		InitializeComponent();
	}

	public category(TypeData type)
	{
		InitializeComponent();
		this.typeData = type;
	}

	protected override async void OnAppearing()
	{
		base.OnAppearing();
		TitleLabel.Text = typeData.TypeName;
		CategoryIcon.Source = typeData.TypeImage;
		updateDate();
	}

	private async void backbtn_Clicked(object sender, EventArgs e)
	{
		await Navigation.PopAsync();
	}

	private void OnDateSelected(object sender, DateChangedEventArgs e)
	{
		this.selectedDate = e.NewDate;
	}

	private async void updateDate()
	{
		DataListView.ItemsSource = null;
		var data = await App.Database.GetTypeDataByDate(App.pocket.ID, typeData.TypeIndex, selectedDate);
		if (data.Count > 0)
		{
			DataListView.ItemsSource = data;
			TitleSummary.Text = await App.Database.GetTypeSummary(App.pocket.ID, typeData.TypeIndex, selectedDate) + " Baht";
		}
		else
		{
			DataListView.ItemsSource = null;
			TitleSummary.Text = "0 Baht";
		}
	}

	private async void ImageButton_Clicked(System.Object sender, System.EventArgs e)
	{
		string searchText = SearchBar.Text;
		if (string.IsNullOrEmpty(searchText))
		{
			DataListView.ItemsSource = null;
			updateDate();
		}
		else
		{
			var data = await App.Database.GetTypeDataByDate(App.pocket.ID, typeData.TypeIndex, selectedDate);
			var filteredData = data.Where(x => x.Detail.ToLower().Contains(searchText.ToLower())).ToList();
			DataListView.ItemsSource = filteredData;
			TitleSummary.Text = await App.Database.GetTypeSummary(App.pocket.ID, typeData.TypeIndex, selectedDate) + " Baht";
		}
	}
}