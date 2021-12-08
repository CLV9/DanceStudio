using CLVP.DanceStudio.WPF.Models;

namespace CLVP.DanceStudio.WPF.ViewModels
{
    public class CreateDirectionViewModel : CreatePageViewModel<DirectionModel>
    {
        protected override string TableName => "Directions";
    }
}
