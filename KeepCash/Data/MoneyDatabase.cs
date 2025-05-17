namespace keepcash.Data;
using SQLite;
using keepcash.Models;
public class MoneyDatabase
{
	SQLiteAsyncConnection _database;
	async Task init()
	{
		if (_database is not null)
			return;
		_database = new SQLiteAsyncConnection(Constants.DatabasePath, Constants.Flags);
		var result = await _database.CreateTableAsync<MoneyHistory>();
	}

	public MoneyDatabase()
	{
	}

	public async Task<List<MoneyHistory>> GetYearData(int selectedYear)
	{
		await init();
		var all = await _database
			.Table<MoneyHistory>()
			.Where(n => n.PocketDataId == App.pocket.ID)
			.ToListAsync();

		return all.Where(n => n.Date.Year == selectedYear).ToList();
	}

	public async Task<List<MoneyHistory>> GetMonthData(int selectedYear, int selectedMonth)
	{
		await init();
		var all = await _database
			.Table<MoneyHistory>()
			.Where(n => n.PocketDataId == App.pocket.ID)
			.ToListAsync();

		return all
			.Where(n => n.Date.Year == selectedYear && n.Date.Month == selectedMonth)
			.ToList();
	}

	public async Task<float> GetExpense(int id)
	{
		await init();
		var moneyHistoryList = await _database
			.Table<MoneyHistory>()
			.Where(n => n.Type != 1 && n.PocketDataId == id)
			.ToListAsync();

		return moneyHistoryList.Sum(n => n.Amount);
	}

	public async Task<float> GetTypeSummary(int id, int type, DateTime date)
	{
		await init();
		var moneyHistoryList = await _database
			.Table<MoneyHistory>()
			.Where(n => n.Type == type && n.PocketDataId == id && n.Date.Equals(date))
			.ToListAsync();

		var sum = moneyHistoryList.Sum(n => n.Amount);
		return sum;
	}

	public async Task<List<MoneyHistory>> GetTypeDataByDate(int id, int type, DateTime date)
	{
		await init();
		var moneyHistoryList = await _database
			.Table<MoneyHistory>()
			.Where(n => n.Type == type && n.PocketDataId == id && n.Date.Equals(date))
			.ToListAsync();
		return moneyHistoryList;
	}

	public async Task<float> GetSummary(int id)
	{
		await init();
		var sum = await GetIncome(id) - await GetExpense(id);
		return sum;
	}

	public async Task<float> GetIncome(int id)
	{
		await init();
		var moneyHistoryList = await _database
			.Table<MoneyHistory>()
			.Where(n => n.Type == 1 && n.PocketDataId == id)
			.ToListAsync();

		var sum = moneyHistoryList.Sum(n => n.Amount);
		return sum;
	}



	public async Task<List<MoneyHistory>> GetMoneyHistorysAsync()
	{
		await init();
		return await _database.Table<MoneyHistory>().ToListAsync();
	}

	public async Task<List<MoneyHistory>> GetMoneyHistorysAsync(int pMoneyHistoryId)
	{
		await init();
		return await _database
			.Table<MoneyHistory>()
			.Where(n => n.PocketDataId == pMoneyHistoryId)
			.ToListAsync();
	}


	public async Task<MoneyHistory> GetMoneyHistoryAsync(int pMoneyHistoryId)
	{
		await init();
		return await _database
			.Table<MoneyHistory>()
			.Where(n => n.ID == pMoneyHistoryId)
			.FirstOrDefaultAsync();
	}

	public async Task<int> SaveMoneyHistoryAsync(MoneyHistory pMoneyHistory)
	{
		await init();
		if (pMoneyHistory.ID != 0)
		{
			return await _database.UpdateAsync(pMoneyHistory);
		}
		else
		{
			return await _database.InsertAsync(pMoneyHistory);
		}
	}

	public async Task<int> DeleteMoneyHistoryAsync(MoneyHistory pDelMoneyHistory)
	{
		await init();
		return await _database.DeleteAsync(pDelMoneyHistory);
	}
}