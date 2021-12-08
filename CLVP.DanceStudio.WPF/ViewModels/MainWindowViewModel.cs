using Caliburn.Micro;
using System.Windows;

namespace CLVP.DanceStudio.WPF.ViewModels
{
    public class MainWindowViewModel : Conductor<object>
    {
        public void LoadClientsPage()
        {
            ActivateItemAsync(new ClientsPageViewModel());
        }

        public void LoadDirectionsPage()
        {
            ActivateItemAsync(new DirectionsPageViewModel());
        }

        public void CloseApp()
        {
            Application.Current.Shutdown();
        }
    }
}
