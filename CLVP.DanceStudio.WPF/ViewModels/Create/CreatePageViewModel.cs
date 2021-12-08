using Caliburn.Micro;
using CLVP.DanceStudio.DAL;

namespace CLVP.DanceStudio.WPF.ViewModels
{
    public abstract class CreatePageViewModel<TModel> : Conductor<object> where TModel : IEntityModel, new()
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

        public event System.Action OnCreate;

        public CreatePageViewModel()
        {
            _model = new TModel();
        }

        private void SaveChanges()
        {
            var dataAccess = Bootstrapper.DataService;
            dataAccess.InsertRecord(TableName, Model);
        }

        public virtual void Create()
        {
            SaveChanges();
            OnCreate?.Invoke();
            TryCloseAsync();
        }

        public void Cancel()
        {
            TryCloseAsync();
        }
    }
}
