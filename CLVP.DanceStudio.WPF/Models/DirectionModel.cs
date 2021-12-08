using CLVP.DanceStudio.DAL;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace CLVP.DanceStudio.WPF.Models
{
    public class DirectionModel : IEntityModel
    {
        [BsonId]
        public ObjectId Id { get; set; }
        public string Name { get; set; }
    }
}