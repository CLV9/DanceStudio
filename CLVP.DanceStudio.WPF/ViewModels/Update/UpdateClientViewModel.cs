using Caliburn.Micro;
using CLVP.DanceStudio.WPF.Models;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Windows;

namespace CLVP.DanceStudio.WPF.ViewModels
{
    public class UpdateClientViewModel : UpdatePageViewModel<ClientModel>
    {
        private IWindowManager _windowManager = new WindowManager();
        private ObservableCollection<SubscriptionModel> _subscriptions;

        protected override string TableName => "TestCollection";

        public ObservableCollection<SubscriptionModel> Subscriptions 
        { 
            get => _subscriptions; 
            private set 
            {
                _subscriptions = new ObservableCollection<SubscriptionModel>(value.OrderByDescending(x => x.EndDate));
            } 
        }

        public UpdateClientViewModel(ClientModel model) : base(model)
        {
            if (model.Subscriptions == null)
            {
                model.Subscriptions = new List<SubscriptionModel>();
                var dataAccess = Bootstrapper.DataService;
                dataAccess.UpdateRecord("TestCollection", Model);
            }
            Subscriptions = new ObservableCollection<SubscriptionModel>(model.Subscriptions);
        }

        public void AddSubscription()
        {
            var viewModel = new CreateSubscriptionViewModel(Model);
            _windowManager.ShowWindowAsync(viewModel);
            viewModel.OnCreate += OnCreate;
            
            void OnCreate()
            {
                Subscriptions = new ObservableCollection<SubscriptionModel>(Model.Subscriptions);
                NotifyOfPropertyChange(() => Subscriptions);
                viewModel.OnCreate -= OnCreate;
            }
        }

        public void DeleteSubscription(SubscriptionModel model)
        {
            var result = MessageBox.Show("Вы действительно хотите удалить абонемент?", "Внимание!", MessageBoxButton.YesNo);
            if (result == MessageBoxResult.Yes)
            {
                Model.RemoveSubscription(model);
                var dataAccess = Bootstrapper.DataService;
                dataAccess.UpdateRecord("TestCollection", Model);
                Subscriptions.Remove(model);
            }
        }

        public void EditSubscription(SubscriptionModel model)
        {
            var viewModel = new UpdateSubscriptionViewModel(model, Model);
            _windowManager.ShowWindowAsync(viewModel);
        }
    }
}
