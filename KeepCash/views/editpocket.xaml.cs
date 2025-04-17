using keepcash.Models;

namespace keepcash.views;

public partial class editpocket : ContentPage
{
	public editpocket()
	{
		InitializeComponent();
	}

	private async void backbtn_Clicked(object sender, EventArgs e)
        {
			if(string.IsNullOrEmpty(Pocketnamelabel.Text) || string.IsNullOrEmpty(Amountlabel.Text))
			{
				await DisplayAlert("Error", "Please fill in all fields", "OK");
				return;

			}
			App.pocket.PocketName = Pocketnamelabel.Text;
			App.pocket.AmountToKeep = float.Parse(Amountlabel.Text);
			await App.pocketDatabase.SavePocketDataAsync(App.pocket);
			
            await Navigation.PopAsync();
        }

	protected override async void OnAppearing()
	{
		base.OnAppearing();
		PocketData data = await App.pocketDatabase.GetPocketDataAsync(1);
		Pocketnamelabel.Text = data.PocketName.ToString();
		Amountlabel.Text = data.AmountToKeep.ToString();
		float sum = await App.Database.GetSummary(App.pocket.ID);
		float total = sum - data.AmountToKeep;
		Availablelabel.Text = total.ToString();
	}
}