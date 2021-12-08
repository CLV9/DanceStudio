using CLVP.DanceStudio.DAL;
using CLVP.DanceStudio.WPF.Models;
using ExcelDataReader;
using MongoDB.Bson;
using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;

namespace CLVP.DanceStudio.ExcelDataProvider
{
    class Program
    {
        static void Main(string[] args)
        {
            MongoDbService data = new MongoDbService();
            //ClearData(data);
            //InsertData(data);
            //BeutifyData(data);
            //FixIds(data);
            //CreateDirectionsAndInstructors(data);
            var client = data.GetRecords<ClientModel>("TestCollection");
            AddNewField(data);
        }

        private static void AddNewField(MongoDbService data)
        {
            var collection = data._db.GetCollection<ClientModel>("TestCollection");
            var update = Builders<ClientModel>.Update.Set("Comment", "");
            var filter = Builders<ClientModel>.Filter.Empty;
            var options = new UpdateOptions { IsUpsert = true };
            collection.UpdateManyAsync(filter, update, options);
        }

        private static void FixIds(MongoDbService data)
        {
            var client = data.GetRecords<ClientModel>("TestCollection");
            foreach (var item in client)
            {
                if (item.Subscriptions == null) item.Subscriptions = new List<SubscriptionModel>();
                foreach (var s in item.Subscriptions)
                {
                    if (s.Id == ObjectId.Empty)
                    {
                        s.Id = ObjectId.GenerateNewId();
                    }

                    if (s.Visits == null) s.Visits = new List<VisitModel>();
                    foreach (var vis in s.Visits)
                    {
                        if (vis.Id == ObjectId.Empty)
                        {
                            vis.Id = ObjectId.GenerateNewId();
                        }
                    }
                }
                data.UpdateRecord("TestCollection", item);
            }
        }

        private static void CreateDirectionsAndInstructors(MongoDbService data)
        {
            //data.ClearTable("Directions");

            var directions = data.GetRecords<DirectionModel>("Directions");

            //foreach (var item in directions)
            //{
            //    data.InsertRecord("Directions", item);
            //}
        }

        private static void BeutifyData(MongoDbService data)
        {
            data.DeleteRecordsByField("TestCollection", "FullName", "разовое занятие");
            data.DeleteRecordsByField("TestCollection", "FullName", "ФИО");
            var ws = data.GetRecords<ClientModel>("TestCollection").Where(x => x.FullName.EndsWith(" "));
            foreach (var item in ws)
            {
                var newClient = new ClientModel()
                {
                    Id = item.Id,
                    FullName = item.FullName.Trim(),
                    Phone = item.Phone.Trim(),
                };
                data.UpdateRecord("TestCollection", newClient);
            }
        }

        private static void InsertData(IDataAccessService data)
        {
            Console.Write("Введите путь к эксель файлу: ");
            var filePath = Console.ReadLine();
            System.Text.Encoding.RegisterProvider(System.Text.CodePagesEncodingProvider.Instance);
            using var stream = File.Open(filePath, FileMode.Open, FileAccess.Read);
            using var reader = ExcelReaderFactory.CreateReader(stream);
            var result = reader.AsDataSet();
            foreach (DataRow row in result.Tables[0].Rows)
            {
                if (!string.IsNullOrEmpty(row[0].ToString()))
                {
                    var client = new ClientModel()
                    {
                        FullName = row[0].ToString(),
                        Phone = row[2].ToString()
                    };
                    data.InsertRecord("TestCollection", client);
                }
            }
        }

        private static void ClearData(IDataAccessService data)
        {
            data.ClearTable("TestCollection");
        }
    }
}
