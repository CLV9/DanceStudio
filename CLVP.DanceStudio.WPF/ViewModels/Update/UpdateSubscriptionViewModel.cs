using Caliburn.Micro;
using CLVP.DanceStudio.WPF.Models;
using System.Collections.ObjectModel;
using System.Windows;

namespace CLVP.DanceStudio.WPF.ViewModels
{
    public class UpdateSubscriptionViewModel : Conductor<object>
    {
		private readonly IWindowManager _wm = new WindowManager();

		private SubscriptionModel _subscription;

		public SubscriptionModel Subscription
		{
			get { return _subscription; }
			set
			{
				_subscription = value;
				NotifyOfPropertyChange(() => Subscription);
			}
		}
		public ClientModel Client { get; private set; }
		public ObservableCollection<VisitModel> Visits { get; private set; }

		public event System.Action OnEdit;

		public UpdateSubscriptionViewModel(SubscriptionModel model, ClientModel client)
		{
			Client = client;
			Subscription = model;
			Visits = new ObservableCollection<VisitModel>(model.Visits);
		}

		public void DeleteVisit(VisitModel visit)
		{
			var result = MessageBox.Show("Вы действительно хотите удалить посещение?", "Внимание!", MessageBoxButton.YesNo);
			if (result == MessageBoxResult.Yes)
			{
				Subscription.DeleteVisit(visit);
				var dataAccess = Bootstrapper.DataService;
				dataAccess.UpdateRecord("TestCollection", Client);
				Visits.Remove(visit);
				NotifyOfPropertyChange(() => Visits);
			}
		}

		public void AddVisit()
		{
			var viewModel = new AddVisitViewModel(Client, Subscription);
			_wm.ShowWindowAsync(viewModel);
			viewModel.OnClientEdited += OnClientEdited;

			void OnClientEdited()
			{
				Visits = new ObservableCollection<VisitModel>(Subscription.Visits);
				NotifyOfPropertyChange(() => Visits);
			}
		}

		public void Create()
		{
			var dataAccess = Bootstrapper.DataService;
			dataAccess.UpdateRecord("TestCollection", Client);
			OnEdit?.Invoke();
			TryCloseAsync();
		}

		public void Cancel()
		{
			TryCloseAsync();
		}
	}
}
