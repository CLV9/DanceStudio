using Caliburn.Micro;
using CLVP.DanceStudio.DAL;
using CLVP.DanceStudio.WPF.Models;
using CLVP.DanceStudio.WPF.ViewModels;
using Newtonsoft.Json;
using System;
using System.IO;
using System.Linq;
using System.Windows;

namespace CLVP.DanceStudio.WPF
{
    public class Bootstrapper : BootstrapperBase
    {
        public static IDataAccessService DataService = new MongoDbService();

        public Bootstrapper()
        {
            Initialize();
        }

        protected override void OnStartup(object sender, StartupEventArgs e)
        {
            DisplayRootViewFor<MainWindowViewModel>();
            CheckForBackup();
        }

        private void CheckForBackup()
        {
            var appDataPath = Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) + "\\DanceStudio\\";
            if (!Directory.Exists(appDataPath))
            {
                Directory.CreateDirectory(appDataPath);
            }

            var backupsPath = appDataPath + "\\Backups\\";
            if (!Directory.Exists(backupsPath))
            {
                Directory.CreateDirectory(backupsPath);
            }

            var path = string.Format("{0}BackupLog.txt", appDataPath);
            if (!File.Exists(path))
            {
                File.CreateText(path).Dispose();
            }

            var lastLine = File.ReadLines(path).LastOrDefault();
            if (lastLine != null)
            {
                var backupDate = DateTime.Parse(lastLine);
                if ((DateTime.Now - backupDate).TotalDays > 3)
                {
                    using StreamWriter file = new StreamWriter(path, true);
                    file.WriteLineAsync(DateTime.Now.ToString());
                    CreateBackup(backupsPath);
                }
            }
            else
            {
                using StreamWriter file = new StreamWriter(path, true);
                file.WriteLineAsync(DateTime.Now.ToString());
                CreateBackup(backupsPath);
            }
        }

        private void CreateBackup(string backupPath)
        {
            var currentDate = DateTime.Now.ToString("dd_MM_yyyy");
            var path = string.Format("{0}{1}.json", backupPath, currentDate);
            var clients = DataService.GetRecords<ClientModel>("TestCollection");
            string json = JsonConvert.SerializeObject(clients, Formatting.Indented);
            File.WriteAllText(path, json);
        }
    }
}
