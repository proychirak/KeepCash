namespace keepcash.views;
using System.Globalization;
public partial class category : ContentPage
{
	public category()
	{
		InitializeComponent();
	}

	private async void backbtn_Clicked(object sender, EventArgs e)
	{
		await Navigation.PopAsync();
	}

	private void OnDateButtonClicked(object sender, EventArgs e)
	{
		HiddenDatePicker.Focus(); // ให้แสดง DatePicker
	}

	private void OnDateSelected(object sender, DateChangedEventArgs e)
	{
		DateTime selectedDate = e.NewDate;
		DateButton.Text = selectedDate.ToString("dd MMM yy", new CultureInfo("en-US"));
	}

}