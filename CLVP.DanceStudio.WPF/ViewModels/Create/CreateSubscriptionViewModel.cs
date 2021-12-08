using Caliburn.Micro;
using CLVP.DanceStudio.WPF.Models;
using MongoDB.Bson;
using System;

namespace CLVP.DanceStudio.WPF.ViewModels
{
	public class CreateSubscriptionViewModel : Conductor<object>
    {
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

		public event System.Action OnCreate;

		public CreateSubscriptionViewModel(ClientModel client)
		{
			Client = client;
			Subscription = new SubscriptionModel()
			{
				Id = ObjectId.GenerateNewId(),
				StartDate = DateTime.Now,
				EndDate = DateTime.Now.AddMonths(1),
			};
		}

		public void Create()
		{
			var dataAccess = Bootstrapper.DataService;
			Client.AddSubscription(Subscription);
			dataAccess.UpdateRecord("TestCollection", Client);
			OnCreate?.Invoke();
			TryCloseAsync();
		}

		public void Cancel()
		{
			TryCloseAsync();
		}
	}
}
