using CLVP.DanceStudio.WPF.Models;

namespace CLVP.DanceStudio.WPF.ViewModels
{
    public class UpdateDirectionViewModel : UpdatePageViewModel<DirectionModel>
    {
        protected override string TableName => "Directions";

        public UpdateDirectionViewModel(DirectionModel model) : base(model)
        {
        }
    }
}
