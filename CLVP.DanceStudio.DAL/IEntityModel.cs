using MongoDB.Bson;

namespace CLVP.DanceStudio.DAL
{
    public interface IEntityModel
    {
        public ObjectId Id { get; set; }
    }
}
