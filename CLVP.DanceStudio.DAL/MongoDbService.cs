using MongoDB.Bson;
using MongoDB.Bson.Serialization;
using MongoDB.Bson.Serialization.Serializers;
using MongoDB.Driver;
using System;
using System.Collections.Generic;

namespace CLVP.DanceStudio.DAL
{
    public class MongoDbService : IDataAccessService
    {
        public IMongoDatabase _db;

        public MongoDbService()
        {
            var settings = MongoClientSettings.FromConnectionString("mongodb+srv://DanceStudioAdmin:1LrJvLKYiaIQBr72@dancestudiocluster.a8vnv.mongodb.net/myFirstDatabase?retryWrites=true&w=majority");
            var client = new MongoClient(settings);
            BsonSerializer.RegisterSerializer(typeof(DateTime), DateTimeSerializer.LocalInstance);
            _db = client.GetDatabase("DanceStudioDb");
        }

        public void ClearTable(string table)
        {
            _db.DropCollection(table);
        }

        public void DeleteRecordById(string table, ObjectId id)
        {
            var filter = Builders<IEntityModel>.Filter.Eq("_id", id);
            _db.GetCollection<IEntityModel>(table).DeleteOne(filter);
        }

        public void DeleteRecordsByField<T>(string table, string field, T value)
        {
            var filter = Builders<IEntityModel>.Filter.Eq(field, value);
            _db.GetCollection<IEntityModel>(table).DeleteMany(filter);
        }

        public T GetRecordById<T>(string table, Guid id)
        {
            var collection = _db.GetCollection<T>(table);
            var filter = Builders<T>.Filter.Eq("Id", id);
            return collection.Find(filter).FirstOrDefault();
        }

        public List<T> GetRecords<T>(string table)
        {
            var collection = _db.GetCollection<T>(table);
            return collection.Find(new BsonDocument()).ToList();
        }

        public void InsertRecord<T>(string table, T record)
        {
            var collection = _db.GetCollection<T>(table);
            collection.InsertOne(record);
        }

        public void UpdateRecord<T>(string table, T record) where T : IEntityModel
        {
            var collection = _db.GetCollection<T>(table);
            var filter = Builders<T>.Filter.Eq("Id", record.Id);
            collection.ReplaceOne(filter, record, new ReplaceOptions() { IsUpsert = true });
        }
    }
}
