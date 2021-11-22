# OpenSearch::DSL

The `opensearch-dsl` library provides a Ruby API for
the `OpenSearch Query DSL`

The library is compatible with Ruby 1.9 or higher and OpenSearch 1.0.0 and higher.

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
require 'opensearch'
require 'opensearch/dsl'
include OpenSearch::DSL

# If you want to use authentication credentials
client = Opensearch::Client.new url: 'https://admin:admin@localhost:9200', log: true

# If you don't want to use authentication credentials
# client = Opensearch::Client.new url: 'http://localhost:9200', log: true

index_name = 'my-dsl-index'
index_body = {
  'settings': {
    'index': {
      'number_of_shards': 4
    }
  }
}
response = client.indices.create(
        index: index_name,
        body: index_body
)

puts 'Creating index:'
puts response

# Add a document to the index.
document = {
        'title': 'ruby',
        'description': 'beta',
        'category': 'search'
}
id = '1'

response = client.index(
        index: index_name,
        body: document,
        id: id,
        refresh: true
)

puts 'Adding document:'
puts response

response = client.search index: index_name, body: search {
      query do
            bool do
                  filter do
                        term category: "search"
                  end
                  must do
                        match title: "ruby"
                  end
            end
      end
}.to_hash

puts 'Search results:'
puts response


# Delete the document.
response = client.delete(
        index: index_name,
        id: id
)

puts 'Deleting document:'
puts response

# Delete the index.
response = client.indices.delete(
        index: index_name
)

puts 'Deleting index:'
puts response

```

## Features Overview

The library allows to programatically build complex search definitions for OpenSearch in Ruby,
which are translated to Hashes, and ultimately, JSON, the language of OpenSearch.

All OpenSearch DSL features are supported, namely:

* Queries and Filter context
* Aggregations
* Suggestions
* Sorting
* Pagination
* Options

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

To launch a separate OpenSearch server for integration tests,
see instructions in the main [README](../README.md#development).

## License

This software is licensed under the [Apache 2 license](./LICENSE).
