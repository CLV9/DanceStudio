using CLVP.DanceStudio.DAL;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System;

namespace CLVP.DanceStudio.WPF.Models
{
    public class VisitModel : IEntityModel
    {
        [BsonId]
        public ObjectId Id { get; set; }
        [BsonRepresentation(BsonType.String)]
        public DateTime Date { get; set; }
        public DirectionModel Direction { get; set; }

        public VisitModel()
        {
            Id = new ObjectId();
        }
    }
}