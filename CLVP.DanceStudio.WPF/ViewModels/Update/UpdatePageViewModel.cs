using Caliburn.Micro;
using CLVP.DanceStudio.DAL;
using System.Windows;

namespace CLVP.DanceStudio.WPF.ViewModels
{
    public abstract class UpdatePageViewModel<TModel> : Conductor<object> where TModel : IEntityModel
    {
        private TModel _model;

        protected abstract string TableName { get; }
        public TModel Model
        {
            get => _model;
            set
            {
                _model = value;
                NotifyOfPropertyChange(() => Model);
            }
        }

        public event System.Action OnEdit;
        public event System.Action OnCancel;

        public UpdatePageViewModel(TModel model)
        {
            _model = model;
        }

        private void SaveChanges()
        {
            var dataAccess = Bootstrapper.DataService;
            dataAccess.UpdateRecord(TableName, Model);
        }

        public void Delete()
        {
            const string message = "Вы уверены, что хотите удалить?";
            const string caption = "Удаление";
            var result = MessageBox.Show(message, caption, MessageBoxButton.YesNo);
            if (result == MessageBoxResult.Yes)
            {
                var dataAccess = Bootstrapper.DataService;
                dataAccess.DeleteRecordById(TableName, Model.Id);
                OnEdit?.Invoke();
                TryCloseAsync();
            }
        }

        public void ApplyChanges()
        {
            SaveChanges();
            OnEdit?.Invoke();
            TryCloseAsync();
        }

        public void CancelChanges()
        {
            OnCancel?.Invoke();
            TryCloseAsync();
        }
    }
}
