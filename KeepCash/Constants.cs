namespace keepcash;

public class Constants
{
	public const string DatabaseFileName = "keepcash.db3";

	public const SQLite.SQLiteOpenFlags Flags =
		SQLite.SQLiteOpenFlags.ReadWrite |
		SQLite.SQLiteOpenFlags.Create |
		SQLite.SQLiteOpenFlags.SharedCache;
	
	public static string DatabasePath => 
		Path.Combine(FileSystem.Current.AppDataDirectory, DatabaseFileName);
}