using keepcash.Data;
using keepcash.Models;
using keepcash.views;

namespace keepcash;

public partial class App : Application
{
	public static MoneyDatabase Database;
	public static PocketDatabase pocketDatabase;
	public static PocketData pocket;
	public App()
	{
		InitializeComponent();
		Database = new Data.MoneyDatabase();
		pocketDatabase = new Data.PocketDatabase();
		MainPage = new NavigationPage(new views.home());
	}
}