namespace keepcash.Models;
using SQLite;
public class PocketData
{
	[PrimaryKey, AutoIncrement]
	public int ID { get; set; }
	public string PocketName { get; set; }

	public float AmountToKeep { get; set; }
	
}