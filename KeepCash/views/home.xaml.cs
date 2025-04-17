namespace keepcash.views;
using keepcash.Models;
using keepcash.Data;
using System.Threading.Tasks;

public partial class home : ContentPage
{
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

		}
		else {
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