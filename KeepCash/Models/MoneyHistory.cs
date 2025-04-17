namespace keepcash.Models;
using SQLite;

public class MoneyHistory
{
	[PrimaryKey, AutoIncrement]
	public int ID { get; set; }
	public int Type { get; set; }
	public DateTime Date { get; set; }
	public string Detail { get; set; }
	public float Amount { get; set; }

	[Indexed]
	public int PocketDataId { get; set; }
}