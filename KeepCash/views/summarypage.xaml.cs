using System;
using System.Collections.Generic;
using Microsoft.Maui.Controls; // เพิ่ม namespace นี้ถ้ายังไม่มี

namespace keepcash.views
{
    public partial class summarypage : ContentPage
    {
        private int startYear = 2024; // ปีที่เริ่มใช้แอป

        public summarypage()
        {
            InitializeComponent();
            LoadYearPicker();
            LoadMonthPicker();
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
                "January", "February", "March", "April", "May", "June",
                "July", "August", "September", "October", "November", "December"
            };

            MonthPicker.ItemsSource = months; // เซ็ตค่าลงใน MonthPicker
            MonthPicker.SelectedIndex = DateTime.Now.Month - 1; // ตั้งค่าปัจจุบันเป็นเดือนนี้
        }
    }
}