using Caliburn.Micro;
using CLVP.DanceStudio.WPF.Models;

namespace CLVP.DanceStudio.WPF.ViewModels
{
    public class DirectionsPageViewModel : TablePageViewModel<DirectionModel>
    {
        private readonly IWindowManager _windowManager = new WindowManager();
        protected override string TableName => "Directions";
        protected override int _pageSize => 100;

        protected override string SearchField(DirectionModel model)
        {
            return model.Name;
        }

        public void Create()
        {
            var viewModel = new CreateDirectionViewModel();
            viewModel.OnCreate += OnCreate;
            _windowManager.ShowWindowAsync(viewModel);

            void OnCreate()
            {
                RefreshCollection();
                viewModel.OnCreate -= OnCreate;
            }
        }

        public void CalculateSalary(DirectionModel direction)
        {
            var viewModel = new CalculateSalaryViewModel(direction);
            _windowManager.ShowWindowAsync(viewModel);
        }

        public void Edit(DirectionModel model)
        {
            var viewModel = new UpdateDirectionViewModel(model);
            viewModel.OnEdit += OnEdit;
            viewModel.OnCancel += OnCancel;
            _windowManager.ShowWindowAsync(viewModel);

            void OnEdit()
            {
                RefreshCollection();
                viewModel.OnEdit -= OnEdit;
            }

            void OnCancel()
            {
                RefreshCollection();
                viewModel.OnCancel -= OnCancel;
            }
        }
    }
}
