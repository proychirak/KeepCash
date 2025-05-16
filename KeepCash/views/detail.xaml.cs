namespace keepcash.views;
using System.Globalization;
using System.Threading.Tasks;
using keepcash.Models;
using System.Collections.ObjectModel;
using Plugin.LocalNotification;

public partial class detail : ContentPage
{
	public DateTime SelectedDate { get; set; } = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 0, 0, 0, DateTimeKind.Utc);
	private int typeindex { get; set; } = 0;
	private ObservableCollection<TypeData> typeDatas { get; set; }
	private Color borderColor { get; set; } = Color.FromHex("#1f1f1f");

	public detail()
	{
		InitializeComponent();
		HiddenDatePicker.Date = SelectedDate;
	}

	protected override async void OnAppearing()
	{
		base.OnAppearing();
		await LoadTypeDataAsync();
		PocketLabel.Text = App.pocket.PocketName;
		AvilableLabel.Text = (await App.Database.GetSummary(App.pocket.ID) - App.pocket.AmountToKeep).ToString() + " Baht";
	}
	
	private async Task LoadTypeDataAsync()
	{
		typeDatas = new ObservableCollection<TypeData>();
		typeDatas.Clear();
		typeDatas.Add(new TypeData(){ TypeIndex = 1, TypeName = "Income", TypeColor = Color.FromRgba(0, 0, 0, 1), TypeImage = "otherincome.png", Total = 0 });
		typeDatas.Add(new TypeData(){ TypeIndex = 2, TypeName = "Food", TypeColor = Color.FromRgba(0, 0, 0, 1), TypeImage = "food.png", Total = 0 });
		typeDatas.Add(new TypeData(){ TypeIndex = 3, TypeName = "Bills", TypeColor = Color.FromRgba(0, 0, 0, 1), TypeImage = "bills.png", Total = 0 });
		typeDatas.Add(new TypeData(){ TypeIndex = 4, TypeName = "Education", TypeColor = Color.FromRgba(0, 0, 0, 1), TypeImage = "education.png", Total = 0 });
		typeDatas.Add(new TypeData(){ TypeIndex = 5, TypeName = "Health", TypeColor = Color.FromRgba(0, 0, 0, 1), TypeImage = "health.png", Total = 0 });
		typeDatas.Add(new TypeData(){ TypeIndex = 6, TypeName = "Personal", TypeColor = Color.FromRgba(0, 0, 0, 1), TypeImage = "personal.png", Total = 0 });
		typeDatas.Add(new TypeData(){ TypeIndex = 7, TypeName = "Fare", TypeColor = Color.FromRgba(0, 0, 0, 1), TypeImage = "fare.png", Total = 0 });
		typeDatas.Add(new TypeData(){ TypeIndex = 8, TypeName = "Others", TypeColor = Color.FromRgba(0, 0, 0, 1), TypeImage = "others.png", Total = 0 });
		
		foreach (TypeData item in typeDatas) {
			var total = await App.Database.GetTypeSummary(App.pocket.ID, item.TypeIndex, SelectedDate);
			item.Total = total;
		}
		
		TypeListView.ItemsSource = typeDatas;
	}
	private async void settingbtn_Clicked(object sender, EventArgs e)
	{
		await Navigation.PushAsync(new setting());
	}

	private async void menu1btn_Clicked(object sender, EventArgs e)
	{
		await Navigation.PushAsync(new home());
	}

	private async void menu2btn_Clicked(object sender, EventArgs e)
	{
		if (Navigation.NavigationStack.LastOrDefault() is detail)

			return;

		await Navigation.PushAsync(new detail());
	}

	private async void menu3btn_Clicked(object sender, EventArgs e)
	{
		await Navigation.PushAsync(new summarypage());
	}

	private void OnDateButtonClicked(object sender, EventArgs e)
	{
		HiddenDatePicker.Focus();
	}

	private async void OnDateSelected(object sender, DateChangedEventArgs e)
	{
		SelectedDate = new DateTime(HiddenDatePicker.Date.Year, HiddenDatePicker.Date.Month, HiddenDatePicker.Date.Day, 0, 0, 0, DateTimeKind.Utc);
		await LoadTypeDataAsync();
		DateButton.Text = SelectedDate.ToString("dd MMM yyyy", new CultureInfo("en-US"));
	}

	private void healthbtn_Clicked(object sender, EventArgs e)
	{
		settype(5);
		HealthButton.BorderWidth = 5;
		HealthButton.BorderColor = borderColor;
	}

	private void foodbtn_Clicked(object sender, EventArgs e)
	{
		settype(2);
		FoodButton.BorderWidth = 5;
		FoodButton.BorderColor = borderColor;
	}

	private void farebtn_Clicked(object sender, EventArgs e)
	{
		settype(7);
		FareButton.BorderWidth = 5;
		FareButton.BorderColor = borderColor;
	}

	private void incomebtn_Clicked(object sender, EventArgs e)
	{
		settype(1);
		IncomeButton.BorderWidth = 5;
		IncomeButton.BorderColor = borderColor;
	}

	private void othersbtn_Clicked(object sender, EventArgs e)
	{
		settype(8);
		OthersButton.BorderWidth = 5;
		OthersButton.BorderColor = borderColor;
	}

	private void personalbtn_Clicked(object sender, EventArgs e)
	{
		settype(6);
		PersonalButton.BorderWidth = 5;
		PersonalButton.BorderColor = borderColor;
	}

	private void educationbtn_Clicked(object sender, EventArgs e)
	{
		settype(4);
		EducationButton.BorderWidth = 5;
		EducationButton.BorderColor = borderColor;
	}

	private void billsbtn_Clicked(object sender, EventArgs e)
	{
		settype(3);
		BillsButton.BorderWidth = 5;
		BillsButton.BorderColor = borderColor;
	}

	private void settype(int index)
	{
		if (index >= 1 && index <= 8)
		{
			typeindex = index;
		}
		IncomeButton.BorderWidth = 0;
		FoodButton.BorderWidth = 0;
		BillsButton.BorderWidth = 0;
		EducationButton.BorderWidth = 0;
		HealthButton.BorderWidth = 0;
		PersonalButton.BorderWidth = 0;
		FareButton.BorderWidth = 0;
		OthersButton.BorderWidth = 0;

		AppTheme currentTheme = Application.Current.RequestedTheme;
		if (currentTheme == AppTheme.Dark)
		{
			borderColor = Color.FromHex("#FFFEEC");
		}
		else
		{
			borderColor = Color.FromHex("#1f1f1f");
		}
	}

	private async void CheckButton_Clicked(object sender, EventArgs e)
	{
		if (string.IsNullOrEmpty(PriceLabel.Text) || string.IsNullOrEmpty(DetailLabel.Text) || typeindex == 0)
		{
			await DisplayAlert("Error", "Please fill in all fields", "OK");
			return;
		}
		MoneyHistory newHistory = new MoneyHistory()
		{
			PocketDataId = App.pocket.ID,
			Amount = float.Parse(PriceLabel.Text),
			Type = typeindex,
			Date = SelectedDate,
			Detail = DetailLabel.Text
		};
		await App.Database.SaveMoneyHistoryAsync(newHistory);

		float currentSpent = await App.Database.GetExpense(App.pocket.ID);
		float userDefinedMax = (await App.Database.GetIncome(App.pocket.ID)) - App.pocket.AmountToKeep;
		Console.WriteLine($"Current Spent: {currentSpent}, User Defined Max: {userDefinedMax}");
		if (currentSpent > userDefinedMax)
		{
			var notificationTime = DateTime.Now.AddSeconds(1);
			var request = new NotificationRequest
			{
				NotificationId = 1001,
				Title = "⚠️ Spending Limit Alert",
				Description = $"You've spent more than your limit ({userDefinedMax} Baht)",
				Schedule = new NotificationRequestSchedule
				{
					NotifyTime = notificationTime,
					RepeatType = NotificationRepeat.Daily
				}
			};
			await LocalNotificationCenter.Current.Show(request);
		}
		settype(0);
		PriceLabel.Text = string.Empty;
		DetailLabel.Text = string.Empty;
		await LoadTypeDataAsync();	
	}

}
