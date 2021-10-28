# OpenSearch::DSL

The `opensearch-dsl` library provides a Ruby API for
the `OpenSearch Query DSL`

The library is compatible with Ruby 1.9 or higher and Elasticsearch 1.0 and higher.

## Installation

Install the package from [Rubygems](https://rubygems.org):

    gem install opensearch-dsl

To use an unreleased version, either add it to your `Gemfile` for [Bundler](http://gembundler.com):

    gem 'opensearch-dsl', git: 'git://github.com/opensearch-project/opensearch-ruby.git'

or install it from a source code checkout:

    git clone https://github.com/opensearch-project/opensearch-ruby
    cd opensearch-ruby/opensearch-dsl
    bundle install
    rake install

## Usage

The library is designed as a group of standalone Ruby modules, classes and DSL methods,
which provide an idiomatic way to build complex search definitions

Let's have a simple example using the declarative variant:

```ruby
require 'opensearch/dsl'
include OpenSearch::DSL

definition = search do
  query do
    match title: 'test'
  end
end

definition.to_hash
# => { query: { match: { title: "test"} } }

require 'opensearch'
client = OpenSearch::Client.new trace: true

client.search body: definition
# curl -X GET 'http://localhost:9200/test/_search?pretty' -d '{
#   "query":{
#     "match":{
#       "title":"test"
#     }
#   }
# }'
# ...
# => {"took"=>10, "hits"=> {"total"=>42, "hits"=> [...] } }
```

Let's build the same definition in a more imperative fashion:

```ruby
require 'opensearch/dsl'
include OpenSearch::DSL

definition = Search::Search.new
definition.query = Search::Queries::Match.new title: 'test'

definition.to_hash
# => { query: { match: { title: "test"} } }
```

The library doesn't depend on an Elasticsearch client -- its sole purpose is to facilitate
building search definitions in Ruby. This makes it possible to use it with any Elasticsearch client:

```ruby
require 'opensearch/dsl'
include OpenSearch::DSL

definition = search { query { match title: 'test' } }

require 'json'
require 'faraday'
client   = Faraday.new(url: 'http://localhost:9200')
response = JSON.parse(
              client.post(
                '/_search',
                JSON.dump(definition.to_hash),
                { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
              ).body
            )
# => {"took"=>10, "hits"=> {"total"=>42, "hits"=> [...] } }
```

## Features Overview

The library allows to programatically build complex search definitions for Elasticsearch in Ruby,
which are translated to Hashes, and ultimately, JSON, the language of Elasticsearch.

All Elasticsearch DSL features are supported, namely:

* Queries and Filter context
* Aggregations
* Suggestions
* Sorting
* Pagination
* Options

An example of a complex search definition is below.

**NOTE:** In order to run the example, you have to allow restoring from the `data.opensearch.org` repository by adding the following configuration line to your `opensearch.yml`:

```ruby
require 'awesome_print'

require 'opensearch'
require 'opensearch/dsl'

include OpenSearch::DSL

client = OpenSearch::Client.new transport_options: { request: { timeout: 3600, open_timeout: 3600 } }

puts "Recovering the 'bicycles.stackexchange.com' index...".yellow

client.indices.delete index: 'bicycles.stackexchange.com', ignore: 404

client.snapshot.create_repository repository: 'data.opensearch.com', body: { type: 'url', settings: { url: 'https://s3.amazonaws.com/<placeholder>/bicycles.stackexchange.com/' } }
client.snapshot.restore repository: 'data.opensearch.com', snapshot: 'bicycles.stackexchange.com', body: { indices: 'bicycles.stackexchange.com' }
until client.cluster.health(level: 'indices')['indices']['bicycles.stackexchange.com']['status'] == 'green'
  r = client.indices.recovery(index: 'bicycles.stackexchange.com', human: true)['bicycles.stackexchange.com']['shards'][0] rescue nil
  print "\r#{r['index']['size']['recovered'] rescue '0b'} of #{r['index']['size']['total'] rescue 'N/A'}".ljust(52).gray
  sleep 1
end; puts

# The search definition
#
definition = search {
  query do

    # Use a `function_score` query to modify the default score
    #
    function_score do
      query do
        filtered do

          # Use a `multi_match` query for the fulltext part of the search
          #
          query do
            multi_match do
              query    'fixed fixie'
              operator 'or'
              fields   %w[ title^10 body ]
            end
          end

          # Use a `range` filter on the `creation_date` field
          #
          filter do
            range :creation_date do
              gte '2013-01-01'
            end
          end
        end
      end

      # Multiply the default `_score` by the document rating
      #
      functions << { script_score: { script: '_score * doc["rating"].value' } }
    end
  end

  # Calculate the most frequently used tags
  #
  aggregation :tags do
    terms do
      field 'tags'

      # Calculate average view count per tag (inner aggregation)
      #
      aggregation :avg_view_count do
        avg field: 'view_count'
      end
    end
  end

  # Calculate the posting frequency
  #
  aggregation :frequency do
    date_histogram do
      field    'creation_date'
      interval 'month'
      format   'yyyy-MM'

      # Calculate the statistics on comment count per day (inner aggregation)
      #
      aggregation :comments do
        stats field: 'comment_count'
      end
    end
  end

  # Calculate the statistical information about the number of comments
  #
  aggregation :comment_count_stats do
    stats field: 'comment_count'
  end

  # Highlight the `title` and `body` fields
  #
  highlight fields: {
    title: { fragment_size: 50 },
    body:  { fragment_size: 50 }
  }

  # Return only a selection of the fields
  #
  source ['title', 'tags', 'creation_date', 'rating', 'user.location', 'user.display_name']
}

puts "Search definition #{'-'*63}\n".yellow
ap   definition.to_hash

# Execute the search request
#
response = client.search index: 'bicycles.stackexchange.com', type: ['question','answer'], body: definition

puts "\nSearch results #{'-'*66}\n".yellow
ap   response
```

NOTE: You have to enable dynamic scripting to be able to execute the `function_score` query, either
      by adding `script.disable_dynamic: false` to your opensearch.yml or command line parameters.

**Please see the extensive RDoc examples in the source code and the integration tests.**

## Development

To work on the code, clone the repository and install the dependencies:

```
git clone https://github.com/opensearch-project/opensearch-ruby
cd opensearch-ruby/opensearch-dsl/
bundle install
```

Use the Rake tasks to run the test suites:

```
bundle exec rake test:unit
bundle exec rake test:integration
```

To launch a separate Elasticsearch server for integration tests,
see instructions in the main [README](../README.md#development).

## License

This software is licensed under the [Apache 2 license](./LICENSE).
