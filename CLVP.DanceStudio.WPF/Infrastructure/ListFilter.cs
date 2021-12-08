using System;
using System.Collections.Generic;

namespace CLVP.DanceStudio.WPF.Infrastructure
{
    public class ListFilter<T>
    {
        private Func<IEnumerable<T>, IEnumerable<T>> _filterFunction;

        public int Priority { get; set; }

        public ListFilter(Func<IEnumerable<T>, IEnumerable<T>> filter, int priority)
        {
            _filterFunction = filter;
            Priority = priority;
        }

        public IEnumerable<T> Apply(IEnumerable<T> list)
        {
            return _filterFunction(list);
        }
    }
}
