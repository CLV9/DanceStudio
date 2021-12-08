using CLVP.DanceStudio.DAL;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System;
using System.Collections.Generic;
using System.Linq;

namespace CLVP.DanceStudio.WPF.Models
{
    public class ClientModel : IEntityModel
    {
        [BsonId]
        public ObjectId Id { get; set; }
        public string FullName { get; set; }
        public string Phone { get; set; }
        public List<SubscriptionModel> Subscriptions { get; set; }
        public string Comment { get; set; }

        public bool HasVisit(DateTime date)
        {
            if (Subscriptions == null) return false;
            if (Subscriptions.Any(x => x.Visits != null && x.Visits.Any(x => x.Date.Date == date.Date)))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public void AddSubscription(SubscriptionModel subscription)
        {
            if (Subscriptions == null) Subscriptions = new List<SubscriptionModel>();
            Subscriptions.Add(subscription);
        }

        public void RemoveSubscription(SubscriptionModel subscription)
        {
            Subscriptions.RemoveAll(x => x.Id == subscription.Id);
        }

        public bool HasVisit(DateTime startDate, DateTime endDate, DirectionModel direction)
        {
            if (Subscriptions == null) return false;
            foreach (var subscription in Subscriptions)
            {
                foreach (var visit in subscription.Visits)
                {
                    if (visit.Date.Date >= startDate.Date && visit.Date.Date <= endDate.Date && visit.Direction.Id == direction.Id)
                    {
                        return true;
                    }
                }
            }
            return false;
        }

        public bool TryAddVisit(VisitModel model)
        {
            if (Subscriptions == null) return false;
            var last = Subscriptions.OrderBy(x => x.EndDate).LastOrDefault();
            if (last == null) return false;
            return last.TryAddVisit(model);
        }

        public int GetVisitsCount(DateTime startDate, DateTime endDate, DirectionModel direction)
        {
            if (Subscriptions == null) return 0;
            return Subscriptions
                .SelectMany(x => x.Visits)
                .Count(x => x.Direction.Id == direction.Id && x.Date >= startDate && x.Date <= endDate);
        }
    }
}
