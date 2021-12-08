using Caliburn.Micro;
using CLVP.DanceStudio.DAL;
using CLVP.DanceStudio.WPF.Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;

namespace CLVP.DanceStudio.WPF.ViewModels
{
	public abstract class TablePageViewModel<TModel> : Screen where TModel : IEntityModel
    {
		private const int PaginationFilterPriority = 10000;
		private const int SearchFilterPriority = 1;

		private string _searchString;
		protected virtual int _pageSize => 10;
		private FilteredList<TModel> _filteredCollection;
		private List<TModel> _obsFilteredCollection;
		private int _pageNumber = 1;

		protected List<TModel> _collection;

		public string SearchString
		{
			get 
			{ 
				return _searchString; 
			}
			set 
			{
				_searchString = value;
				OnSearchStringUpdated();
				NotifyOfPropertyChange(() => PagesCount);
				NotifyOfPropertyChange(() => PagingString);
				NotifyOfPropertyChange(() => SearchString);
			}
		}
		public List<TModel> FilteredCollection 
		{
			get => _obsFilteredCollection;
			private set
			{
				_obsFilteredCollection = value;
				NotifyOfPropertyChange(() => PagesCount);
				NotifyOfPropertyChange(() => PagingString);
				NotifyOfPropertyChange(() => FilteredCollection);
			}
		}
		public int PageNumber 
		{ 
			get => _pageNumber; 
			private set 
			{
				_pageNumber = value;
				NotifyOfPropertyChange(() => PagesCount);
				NotifyOfPropertyChange(() => PagingString);
				OnPageChanged();
			} 
		}

		public int PagesCount
		{
			get
			{
				return _filteredCollection.WithoutPagingCount() / _pageSize + 1;
			}
		}

		public string PagingString => $"{PageNumber}/{PagesCount}";

		protected abstract string TableName { get; }

		public TablePageViewModel()
		{
			var dataAccessService = Bootstrapper.DataService;
			_collection = dataAccessService.GetRecords<TModel>(TableName);
			_filteredCollection = new FilteredList<TModel>(_collection);
			FilteredCollection = new List<TModel>(_filteredCollection);
			SetFilter("Pagination", PaginationFilterPriority, x => x.Skip((PageNumber - 1) * _pageSize).Take(_pageSize));
		}

		protected abstract string SearchField(TModel model);

		protected virtual void OnSearchStringUpdated()
		{
			if (string.IsNullOrEmpty(SearchString))
			{
				RemoveFilter("Search");
			}
			else
			{
				SetFilter("Search", SearchFilterPriority, x => x.Where(e => SearchField(e).ToLower().Contains(SearchString.ToLower())));
			}
		}

		protected virtual void OnPageChanged()
		{
			SetFilter("Pagination", PaginationFilterPriority, x => x.Skip((PageNumber - 1) * _pageSize).Take(_pageSize));
			NotifyOfPropertyChange(() => FilteredCollection);
		}

		protected void RefreshCollection()
		{
			var dataAccessService = Bootstrapper.DataService;
			_collection = dataAccessService.GetRecords<TModel>(TableName);
			_filteredCollection.Collection = _collection;
			FilteredCollection = new List<TModel>(_filteredCollection);
		}

		protected void SetFilter(string name, int priority, Func<IEnumerable<TModel>, IEnumerable<TModel>> filter)
		{
			_filteredCollection.SetFilter(name, priority, filter);
			FilteredCollection = new List<TModel>(_filteredCollection);
		}

		protected void RemoveFilter(string name) 
		{
			_filteredCollection.RemoveFilter(name);
			FilteredCollection = new List<TModel>(_filteredCollection);
		}

		public void SetFirstPage()
		{
			PageNumber = 1;
		}

		public void SetNextPage()
		{
			if (PageNumber < PagesCount)
			{
				PageNumber++;
			}
		}

		public void SetPreviousPage()
		{
			if (PageNumber > 1)
			{
				PageNumber--;
			}
		}
	}
}
