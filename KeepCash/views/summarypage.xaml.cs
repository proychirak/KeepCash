using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using keepcash.Models;
using LiveChartsCore;
using LiveChartsCore.SkiaSharpView;
using LiveChartsCore.SkiaSharpView.Painting;
using Microsoft.Maui.Controls; 
using Microsoft.Maui.Graphics.Platform;
using SkiaSharp;

namespace keepcash.views
{
    public partial class summarypage : ContentPage
    {
        private int startYear = 2024; // ปีที่เริ่มใช้แอป
        List<MoneyHistory> histories = new List<MoneyHistory>();
        private int typeindex { get; set; } = 0;
        private ObservableCollection<TypeData> typeDatas { get; set; }

        public summarypage()
        {
            InitializeComponent();
            LoadYearPicker();
            LoadMonthPicker();
            loadSummary();
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
            await Navigation.PushAsync(new detail());
        }

        private async void menu3btn_Clicked(object sender, EventArgs e)
        {
            if (Navigation.NavigationStack.LastOrDefault() is summarypage)

                return;
            await Navigation.PushAsync(new summarypage());
        }

        private void LoadYearPicker()
        {
            int currentYear = DateTime.Now.Year; // ปีปัจจุบัน
            List<int> years = new List<int>();

            for (int year = startYear; year <= currentYear; year++)
            {
                years.Add(year);
            }

            YearPicker.ItemsSource = years; // เซ็ตค่าปีลงใน Picker
            YearPicker.SelectedIndex = years.Count - 1; // ตั้งค่าเริ่มต้นเป็นปีปัจจุบัน
        }

        private void LoadMonthPicker()
        {
            List<string> months = new List<string>
            {
                "None", "January", "February", "March", "April", "May", "June",
                "July", "August", "September", "October", "November", "December"
            };

            MonthPicker.ItemsSource = months; // เซ็ตค่าลงใน MonthPicker
            MonthPicker.SelectedIndex = DateTime.Now.Month; // ตั้งค่าปัจจุบันเป็นเดือนนี้
        }

        private void YearPicker_SelectedIndexChanged(object sender, EventArgs e)
        {
            summaryUpdate();
        }

        private void MonthPicker_SelectedIndexChanged(object sender, EventArgs e)
        {
            summaryUpdate();
        }
        private async void loadSummary()
        {
            if (App.pocket == null)
            {
                await DisplayAlert("Error", "Pocket not found", "OK");
                return;
            }

            float summary = await App.Database.GetSummary(App.pocket.ID);
            BalanceLabel.Text = summary + " Baht";
            summaryUpdate();
        }
        private async void summaryUpdate()
        {
            int selectedYear = (int)YearPicker.SelectedItem;
            int selectedMonth = MonthPicker.SelectedIndex;
            if (selectedMonth == 0)
            {
                histories = await App.Database.GetYearData(selectedYear);
            }
            else
            {
                histories = await App.Database.GetMonthData(selectedYear, selectedMonth);
            }

            typeDatas = new ObservableCollection<TypeData>();
            typeDatas.Clear();
            typeDatas.Add(new TypeData() { TypeIndex = 1, TypeName = "Income", TypeColor = Color.FromRgba(229, 164, 74, 255), TypeImage = "otherincome.png", Total = 0 });
            typeDatas.Add(new TypeData() { TypeIndex = 2, TypeName = "Food", TypeColor = Color.FromRgba(86, 154, 87, 255), TypeImage = "food.png", Total = 0 });
            typeDatas.Add(new TypeData() { TypeIndex = 3, TypeName = "Bills", TypeColor = Color.FromRgba(81, 129, 166, 255), TypeImage = "bills.png", Total = 0 });
            typeDatas.Add(new TypeData() { TypeIndex = 4, TypeName = "Education", TypeColor = Color.FromRgba(215, 89, 85, 255), TypeImage = "education.png", Total = 0 });
            typeDatas.Add(new TypeData() { TypeIndex = 5, TypeName = "Health", TypeColor = Color.FromRgba(154, 196, 201, 255), TypeImage = "health.png", Total = 0 });
            typeDatas.Add(new TypeData() { TypeIndex = 6, TypeName = "Personal", TypeColor = Color.FromRgba(61, 140, 130, 255), TypeImage = "personal.png", Total = 0 });
            typeDatas.Add(new TypeData() { TypeIndex = 7, TypeName = "Fare", TypeColor = Color.FromRgba(237, 200, 90, 255), TypeImage = "fare.png", Total = 0 });
            typeDatas.Add(new TypeData() { TypeIndex = 8, TypeName = "Others", TypeColor = Color.FromRgba(172, 85, 147, 255), TypeImage = "others.png", Total = 0 });

            foreach (MoneyHistory history in histories)
            {
                typeDatas[history.Type - 1].Total += history.Amount;
            }

            TypeListView.ItemsSource = typeDatas;

            var pieSeriesList = new List<ISeries>();
            for (int i = 0; i < typeDatas.Count; i++)
            {

                pieSeriesList.Add(new PieSeries<double>
                {
                    Values = new double[] { typeDatas[i].Total },
                    Name = typeDatas[i].TypeName,
                    Fill = new SolidColorPaint(SKColor.Parse(typeDatas[i].TypeColor.ToHex()))
                });
            }

            PieChart.Series = pieSeriesList.ToArray();
        }
        
        
        private async void ListView_ItemSelected(System.Object sender, Microsoft.Maui.Controls.SelectedItemChangedEventArgs e)
        {
            if (e.SelectedItem != null)
            {
                TypeData selectedType = e.SelectedItem as TypeData;
                TypeListView.SelectedItem = null;
                await Navigation.PushAsync(new views.category(selectedType));
            }
        }
    }
}