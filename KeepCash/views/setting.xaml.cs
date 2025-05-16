using System.ComponentModel;
using System.Threading.Tasks;
using Plugin.LocalNotification;
using Plugin.LocalNotification.AndroidOption;

namespace keepcash.views
{
    public partial class setting : ContentPage
    {
        private TimeSpan _notificationTime;
        private bool _isNotificationEnabled;
        public setting()
        {
            InitializeComponent();
        }

        protected override async void OnAppearing()
        {
            base.OnAppearing();

            Boolean isNotification = App.pocket.IsNotification;
            if (isNotification)
            {
                NotificationSwitch.IsToggled = true;
            }
            else
            {
                NotificationSwitch.IsToggled = false;
            }

            TimeSpan timeSpan = App.pocket.NotificationTime;
            NotificationTimePicker.Time = timeSpan;
        }

        private async void NotificationTimePicker_TimeChanged(object sender, PropertyChangedEventArgs e)
        {
            var result = await LocalNotificationCenter.Current.RequestNotificationPermission();
            if (!result)
            {
                await Application.Current.MainPage.DisplayAlert("Permission Denied", "Please enable notifications in settings.", "OK");
                return;
            }

            if (e.PropertyName == "Time")
            {
                var selectedTime = NotificationTimePicker.Time;
                _notificationTime = selectedTime;
                ScheduleDailyNotification();
                App.pocket.NotificationTime = selectedTime;
                await App.pocketDatabase.SavePocketDataAsync(App.pocket);
            }
        }

        private async void NotificationSwitch_Toggled(object sender, ToggledEventArgs e)
        {
            bool isOn = e.Value;
            App.pocket.IsNotification = isOn;
            await App.pocketDatabase.SavePocketDataAsync(App.pocket);
        }

        private async void ScheduleDailyNotification()
        {
            var notificationTime = DateTime.Today.Add(_notificationTime);
            if (notificationTime <= DateTime.Now)
                notificationTime = notificationTime.AddDays(1); // shift to tomorrow

            var request = new NotificationRequest
            {
                NotificationId = 1001,
                Title = "💰 Daily Reminder",
                Description = "Don't forget to check your spending today!",
                Schedule = new NotificationRequestSchedule
                {
                    NotifyTime = notificationTime,
                    RepeatType = NotificationRepeat.Daily
                }
            };

            await LocalNotificationCenter.Current.Show(request);
        }

        private void ThemeLight_Clicked(object sender, EventArgs e)
        {
            Application.Current.UserAppTheme = AppTheme.Light;
        }
        private void ThemeDark_Clicked(object sender, EventArgs e)
        {
            Application.Current.UserAppTheme = AppTheme.Dark;
        }

    private async void Gohome(object sender, EventArgs e)
        {
            Navigation.PushAsync(new home());
        }

    }
}

       
