# Search
OpenSearch provides a powerful search API that allows you to search for documents in an index. The search API supports a number of parameters that allow you to customize the search operation. In this guide, we will explore the search API and its parameters.

# Setup
Let's start by creating an index and adding some documents to it:

```ruby
require 'opensearch-ruby'
client = OpenSearch::Client.new({ host: 'localhost' })
client.indices.create(index: 'movies')



10.times do |i|
  client.index(
    index: 'movies',
    id: i,
    body: {
      title: "The Dark Knight #{i}",
      director: 'Christopher Nolan',
      year: 2008 + i
    }
  )
end

client.index(
  index: 'movies',
  body: {
    title: 'The Godfather',
    director: 'Francis Ford Coppola',
    year: 1972
  }
)
client.index(
  index: 'movies',
  body: {
    title: 'The Shawshank Redemption',
    director: 'Frank Darabont',
    year: 1994
  }
)

client.indices.refresh(index: 'movies') # refresh the index to make the documents searchable
```

## Search API

### Basic Search

The search API allows you to search for documents in an index. The following example searches for ALL documents in the `movies` index:

```ruby
puts client.search(index: 'movies').dig('hits', 'count')
```

You can also search for documents that match a specific query. The following example searches for documents that match the query `dark knight`:

```ruby
puts client.search(
  index: 'movies',
  body: {
    query: {
      match: {
        title: 'dark knight'
      }
    }
  }
).dig('hits', 'hits')
```

OpenSearch query DSL allows you to specify complex queries. Check out the [OpenSearch query DSL documentation](https://opensearch.org/docs/latest/query-dsl/) for more information.

### Basic Pagination

The search API allows you to paginate through the search results. The following example searches for documents that match the query `dark knight`, sorted by `year` in ascending order, and returns the first 2 results after skipping the first 5 results:

```ruby
search_body = {
  query: {
    match: {
      title: 'dark knight'
    }
  },
  sort: [
    {
      year: {
        order: 'asc'
      }
    }
  ]
}

puts client.search(
  index: 'movies',
  size: 2,
  from: 5,
  body: search_body
).dig('hits', 'hits')
```

With sorting, you can also use the `search_after` parameter to paginate through the search results. Let's say you have already displayed the first page of results, and you want to display the next page. You can use the `search_after` parameter to paginate through the search results. The following example will demonstrate how to get the first 3 pages of results using the search query of the previous example:

```ruby
page_1 = client.search(
  index: 'movies',
  size: 2,
  body: search_body
).dig('hits', 'hits')

page_2 = client.search(
  index: 'movies',
  size: 2,
  body: search_body.merge(search_after: page_1.last['sort'])
).dig('hits', 'hits')

page_3 = client.search(
  index: 'movies',
  size: 2,
  body: search_body.merge(search_after: page_2.last['sort'])
).dig('hits', 'hits')
```

### Pagination with scroll

When retrieving large amounts of non-real-time data, you can use the `scroll` parameter to paginate through the search results. 

```ruby
page_1 = client.search(
  index: 'movies',
  scroll: '1m',
  size: 2,
  body: search_body
)

page_2 = client.scroll(
  scroll_id: page_1['_scroll_id'],
  scroll: '1m'
)

page_3 = client.scroll(
  scroll_id: page_2['_scroll_id'],
  scroll: '1m'
)
```

### Pagination with Point in Time

The scroll example above has one weakness: if the index is updated while you are scrolling through the results, they will be paginated inconsistently. To avoid this, you should use the "Point in Time" feature. The following example demonstrates how to use the `point_in_time` and `pit_id` parameters to paginate through the search results:

```ruby
# create a point in time
pit = client.create_pit(
  index: 'movies',
  keep_alive: '1m'
)

# Include pit info in the search body
pit_search_body = search_body.merge(
  pit: {
    id: pit['pit_id'],
    keep_alive: '1m'
  })

# Get the first 3 pages of results
page_1 = client.search(
  size: 2,
  body: pit_search_body
).dig('hits', 'hits')

page_2 = client.search(
  size: 2,
  body: pit_search_body.merge(
    search_after: page_1.last.dig('sort'))
).dig('hits', 'hits')

page_3 = client.search(
  size: 2,
  body: pit_search_body.merge(
    search_after: page_2.last.dig('sort'))
).dig('hits', 'hits')

# Print out the titles of the first 3 pages of results
puts page_1.map { |hit| hit.dig('_source', 'title') }
puts page_2.map { |hit| hit.dig('_source', 'title') }
puts page_3.map { |hit| hit.dig('_source', 'title') }

# delete the point in time
client.delete_pit(body: { pit_id: pit['pit_id'] })
```
Note that a point-in-time is associated with an index or a set of index. So, when performing a search with a point-in-time, you DO NOT specify the index in the search.

## Cleanup

```ruby
client.indices.delete(index: 'movies')
```
