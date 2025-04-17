namespace keepcash.views
{
    public partial class setting : ContentPage
    {
        public setting()
        {
            InitializeComponent();

            
        }
    private async void Gohome(object sender, EventArgs e)
        {
            Navigation.PushAsync(new home());
        }
    }
}

       
