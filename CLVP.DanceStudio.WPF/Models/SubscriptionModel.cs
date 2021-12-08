using CLVP.DanceStudio.DAL;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System;
using System.Collections.Generic;

namespace CLVP.DanceStudio.WPF.Models
{
    public class SubscriptionModel : IEntityModel
    {
        [BsonId]
        public ObjectId Id { get; set; }
        [BsonDateTimeOptions(Kind = DateTimeKind.Local)]
        public DateTime StartDate { get; set; }
        [BsonDateTimeOptions(Kind = DateTimeKind.Local)]
        public DateTime EndDate { get; set; }
        public SubscriptionType Type { get; set; }
        public int TotalVisits { get; set; }
        public List<VisitModel> Visits { get; set; } = new List<VisitModel>();

        public int VisitsCount => Visits.Count;

        public bool TryAddVisit(VisitModel visit)
        {
            if (Visits == null) Visits = new List<VisitModel>();
            if (Type == SubscriptionType.Unlimited || Visits.Count < TotalVisits && DateTime.Now < EndDate)
            {
                Visits.Add(visit);
                return true;
            }
            else
            {
                return false;
            }
        }

        public void DeleteVisit(VisitModel visit)
        {
            Visits.RemoveAll(x => x.Id == visit.Id);
        }
    }

    public enum SubscriptionType
    {
        Standart,
        Unlimited,
    }
}
