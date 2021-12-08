using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

namespace CLVP.DanceStudio.WPF.Infrastructure
{
    public class FilteredList<T> : IEnumerable<T>
    {
        private Dictionary<string, ListFilter<T>> _filters;

        public List<T> Collection { get; set; }
        public IEnumerable<T> FilteredCollection
        {
            get
            {
                return Apply(Collection);
            }
        }

        public FilteredList(List<T> collection)
        {
            _filters = new Dictionary<string, ListFilter<T>>();
            Collection = collection;
        }

        private IEnumerable<T> Apply(IEnumerable<T> list)
        {
            var changedList = list;
            foreach (var filter in _filters.Values.OrderBy(x => x.Priority))
            {
                changedList = filter.Apply(changedList);
            }
            return changedList;
        }

        public void SetFilter(string name, int priority, Func<IEnumerable<T>, IEnumerable<T>> filter)
        {
            if (_filters.ContainsKey(name))
            {
                _filters[name] = new ListFilter<T>(filter, priority);
            }
            else
            {
                _filters.Add(name, new ListFilter<T>(filter, priority));
            }
        }

        public void RemoveFilter(string name)
        {
            _filters.Remove(name);
        }

        public int WithoutPagingCount()
        {
            IEnumerable<T> changedList = Collection;
            foreach (var filter in _filters.OrderBy(x => x.Value.Priority))
            {
                if (filter.Key != "Pagination")
                {
                    var fil = filter.Value;
                    changedList = fil.Apply(changedList);
                }
            }
            return changedList.Count();
        }

        public IEnumerator<T> GetEnumerator()
        {
            return FilteredCollection.GetEnumerator();
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return FilteredCollection.GetEnumerator();
        }
    }
}
