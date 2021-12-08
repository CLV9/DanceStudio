using Caliburn.Micro;
using CLVP.DanceStudio.WPF.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace CLVP.DanceStudio.WPF.ViewModels
{
    public class CalculateSalaryViewModel : Conductor<object>
    {
        private DateTime _startDate;
        private DateTime _endDate;
        private float _moneyForVisit;
        private List<ClientModel> _clients;

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
                NotifyOfPropertyChange(() => TotalSalary);
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
                NotifyOfPropertyChange(() => TotalSalary);
            }
        }
        public DirectionModel Direction { get; private set; }
        public float MoneyForVisit
        {
            get { return _moneyForVisit; }
            set 
            { 
                _moneyForVisit = value;
                NotifyOfPropertyChange(() => MoneyForVisit);
                NotifyOfPropertyChange(() => TotalSalary);
            }
        }
        public float TotalSalary => _clients.Sum(x => x.GetVisitsCount(StartDate, EndDate, Direction)) * MoneyForVisit;

        public CalculateSalaryViewModel(DirectionModel model)
        {
            Direction = model;
            StartDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
            EndDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.DaysInMonth(DateTime.Now.Year, DateTime.Now.Month));
            _clients = Bootstrapper.DataService.GetRecords<ClientModel>("TestCollection");
        }

        public void CloseWindow()
        {
            TryCloseAsync();
        }
    }
}
