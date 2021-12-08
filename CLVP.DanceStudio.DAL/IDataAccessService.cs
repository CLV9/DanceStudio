using MongoDB.Bson;
using System;
using System.Collections.Generic;

namespace CLVP.DanceStudio.DAL
{
    public interface IDataAccessService
    {
        List<T> GetRecords<T>(string table);
        void InsertRecord<T>(string table, T record);
        void DeleteRecordById(string table, ObjectId id);
        void UpdateRecord<T>(string table, T record) where T : IEntityModel;
        T GetRecordById<T>(string table, Guid id);
        void DeleteRecordsByField<T>(string table, string field, T value);
        void ClearTable(string table);
    }
}
