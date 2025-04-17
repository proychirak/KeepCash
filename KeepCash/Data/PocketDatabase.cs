namespace keepcash.Data;
using SQLite;
using keepcash.Models;
public class PocketDatabase
{
	SQLiteAsyncConnection _database_pocket;
	async Task Init()
	{
		if (_database_pocket != null)
			return;
		
		_database_pocket = new SQLiteAsyncConnection(
			Constants.DatabasePath,
			Constants.Flags
			);
		
		await _database_pocket.CreateTableAsync<PocketData>();
	}

	public PocketDatabase()
	{
	}

	public async Task<PocketData> GetPocketDataAsync(int id)
	{
		await Init();
		return await _database_pocket.Table<PocketData>()
			.Where(i => i.ID == id)
			.FirstOrDefaultAsync();
	}

	public async Task<int> SavePocketDataAsync(PocketData pPocketData)
	{
		await Init();
		if (pPocketData.ID != 0)
		{
			return await _database_pocket.UpdateAsync(pPocketData);
		}
		else
		{
			return await _database_pocket.InsertAsync(pPocketData);
		}
	}

	public async Task<int> DeletePocketDataAsync(PocketData pDelPocketData)
	{
		await Init();
		return await _database_pocket.DeleteAsync(pDelPocketData);
	}
}