using CLVP.DanceStudio.WPF.Models;
using System.Linq;
using System.Windows;

namespace CLVP.DanceStudio.WPF.ViewModels
{
    public class CreateClientViewModel : CreatePageViewModel<ClientModel>
    {
        protected override string TableName => "TestCollection";

        public override void Create()
        {
            var dataAccess = Bootstrapper.DataService;
            if (string.IsNullOrEmpty(Model.FullName))
            {
                MessageBox.Show("Введите ФИО!", "Внимание!");
                return;
            }
            if (dataAccess.GetRecords<ClientModel>(TableName).Any(x => x.FullName == Model.FullName))
            {
                MessageBox.Show("Уже есть клиент с таким именем!", "Внимание!");
                return;
            }
            base.Create();
        }
    }
}
