using Caliburn.Micro;
using CLVP.DanceStudio.DAL;
using CLVP.DanceStudio.WPF.Models;
using MongoDB.Bson;
using System;
using System.Collections.Generic;
using System.Windows;

namespace CLVP.DanceStudio.WPF.ViewModels
{
    public class AddVisitViewModel : Conductor<object>
    {
        private readonly IDataAccessService _dto;
        private readonly IWindowManager _windowManager = new WindowManager();

        private List<DirectionModel> _directions;
        private DirectionModel _selectedDirection;
        private DateTime _visitDate;
        private SubscriptionModel _subscription;

        public ClientModel Client { get; set; }
        public List<DirectionModel> Directions
        {
            get { return _directions; }
            set
            {
                _directions = value;
                NotifyOfPropertyChange(() => Directions);
            }
        }
        public DirectionModel SelectedDirection
        {
            get
            {
                return _selectedDirection;
            }
            set
            {
                _selectedDirection = value;
                NotifyOfPropertyChange(() => SelectedDirection);
                NotifyOfPropertyChange(() => CanApplyChanges);
            }
        }
        public DateTime VisitDate
        {
            get { return _visitDate; }
            set
            {
                _visitDate = value;
                NotifyOfPropertyChange(() => VisitDate);
            }
        }
        public bool CanApplyChanges => SelectedDirection != null;

        public event System.Action OnClientEdited;

        public AddVisitViewModel(ClientModel client)
        {
            _dto = Bootstrapper.DataService;
            Client = client;
            Directions = _dto.GetRecords<DirectionModel>("Directions");
            _visitDate = DateTime.Now;
        }

        public AddVisitViewModel(ClientModel client, SubscriptionModel subscription) : this(client)
        {
            this._subscription = subscription;
        }

        private void HandleMessage(MessageBoxResult messageResult)
        {
            switch (messageResult)
            {
                case MessageBoxResult.Yes:
                    var viewModel = new CreateSubscriptionViewModel(Client);
                    _windowManager.ShowWindowAsync(viewModel);
                    return;
                case MessageBoxResult.No:
                    return;
            }
        }

        public void ApplyChanges()
        {
            var visit = new VisitModel() { Id = ObjectId.GenerateNewId() , Date = VisitDate, Direction = SelectedDirection };

            if (_subscription != null)
            {
                if (_subscription.TryAddVisit(visit) == false)
                {
                    MessageBox.Show("В абонементе нет свободных посещений.", "Внимание!", MessageBoxButton.OK);
                    return;
                }
            }
            else if (Client.TryAddVisit(visit) == false)
            {
                var messageResult = MessageBox.Show("У клиента нету доступного абонемента для посещения. Хотите создать новый абонемент?", "Внимание!", MessageBoxButton.YesNo);
                HandleMessage(messageResult);
                return;
            }

            _dto.UpdateRecord("TestCollection", Client);
            OnClientEdited?.Invoke();
            TryCloseAsync();
        }

        public void CancelChanges()
        {
            TryCloseAsync();
        }
    }
}
