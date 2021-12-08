using Caliburn.Micro;
using CLVP.DanceStudio.WPF.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace CLVP.DanceStudio.WPF.ViewModels
{
    public class ClientsPageViewModel : TablePageViewModel<ClientModel>
    {
        private const int DirectionFilterPriority = 2;
        private readonly IWindowManager _windowManager = new WindowManager();
        private DataTable _clientTable;
        private DirectionModel _selectedDirection;
        private DateTime _startDate;
        private DateTime _endDate;

        protected override int _pageSize => 30;
        protected override string TableName => "TestCollection";
        public DataTable ClientsTable
        {
            get => _clientTable;
            set
            {
                _clientTable = value;
                NotifyOfPropertyChange(() => ClientsTable);
            }
        }
        public List<DirectionModel> Directions { get; private set; }
        public DirectionModel SelectedDirection 
        { 
            get => _selectedDirection;
            set
            {
                _selectedDirection = value;
                if (_selectedDirection != null)
                {
                    SetFilter("Direction", DirectionFilterPriority, x => x.Where(x => x.HasVisit(StartDate, EndDate, value)));
                }
                else
                {
                    RemoveFilter("Direction");
                }
                NotifyOfPropertyChange(() => SelectedDirection);
                RefreshTable();
            }
        }
        public DateTime StartDate
        {
            get 
            { 
                return _startDate; 
            }
            set 
            { 
                _startDate = value; 
                NotifyOfPropertyChange(() => StartDate);
                RefreshTable();
            }
        }
        public DateTime EndDate
        {
            get
            {
                return _endDate;
            }
            set
            {
                _endDate = value;
                NotifyOfPropertyChange(() => EndDate);
                RefreshTable();
            }
        }

        public ClientsPageViewModel() : base()
        {
            var dataAccessService = Bootstrapper.DataService;
            Directions = dataAccessService.GetRecords<DirectionModel>("Directions");
            StartDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
            EndDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.DaysInMonth(DateTime.Now.Year, DateTime.Now.Month));
            RefreshTable();
        }

        private void RefreshTable()
        {
            var dataTable = new DataTable();
            dataTable.Columns.Add("ФИО", typeof(string));
            dataTable.Columns.Add("Телефон", typeof(string));
            dataTable.Columns.Add("Комментарий", typeof(string));


            for (DateTime i = StartDate; i <= EndDate; i = i.AddDays(1))
            {
                dataTable.Columns.Add(i.ToString("dd-MM-yyyy"), typeof(string));
            }

            foreach (var client in FilteredCollection)
            {
                List<object> cells = new List<object>
                {
                    client.FullName,
                    client.Phone,
                    client.Comment,
                };

                for (DateTime i = StartDate; i <= EndDate; i = i.AddDays(1))
                {
                    bool hasVisit;
                    if (SelectedDirection != null)
                    {
                        hasVisit = client.HasVisit(i, i, SelectedDirection);
                    }
                    else
                    {
                        hasVisit = client.HasVisit(i);
                    }
                    cells.Add(hasVisit ? "+" : "");
                }

                DataRow row = dataTable.NewRow();

                for (int i = 0; i < cells.Count; i++)
                {
                    row[i] = cells[i];
                }
                dataTable.Rows.Add(row);
            }

            ClientsTable = dataTable;
        }

        protected override string SearchField(ClientModel model)
        {
            return model.FullName;
        }

        protected override void OnSearchStringUpdated()
        {
            base.OnSearchStringUpdated();
            RefreshTable();
        }

        protected override void OnPageChanged()
        {
            base.OnPageChanged();
            RefreshTable();
        }

        public void AddVisit(DataRowView row)
        {
            var index = ClientsTable.AsDataView().Table.Rows.IndexOf(row.Row);
            var client = FilteredCollection.ElementAt(index);
            var visitViewModel = new AddVisitViewModel(client);
            visitViewModel.OnClientEdited += OnClientEdited;
            _windowManager.ShowWindowAsync(visitViewModel);

            void OnClientEdited()
            {
                RefreshCollection();
                RefreshTable();
                visitViewModel.OnClientEdited -= OnClientEdited;
            }
        }

        public void EditClient(DataRowView row)
        {
            var index = ClientsTable.AsDataView().Table.Rows.IndexOf(row.Row);
            var client = FilteredCollection.ElementAt(index);
            var editViewModel = new UpdateClientViewModel(client);
            editViewModel.OnEdit += OnClientEdited;
            _windowManager.ShowWindowAsync(editViewModel);

            void OnClientEdited()
            {
                RefreshCollection();
                RefreshTable();
                editViewModel.OnEdit -= OnClientEdited;
            }
        }

        public void CreateClient()
        {
            var createViewModel = new CreateClientViewModel();
            createViewModel.OnCreate += OnClientCreated;
            _windowManager.ShowWindowAsync(createViewModel);

            void OnClientCreated()
            {
                RefreshCollection();
                RefreshTable();
                createViewModel.OnCreate -= OnClientCreated;
            }
        }

        public void ClearDirection()
        {
            SelectedDirection = null;
        }
    }
}
