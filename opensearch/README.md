# OpenSearch

The `opensearch` library provides a Ruby client and API for [OpenSearch](http://opensearch.com).

Features overview:

* Pluggable logging and tracing
* Pluggable connection selection strategies (round-robin, random, custom)
* Pluggable transport implementation, customizable and extendable
* Pluggable serializer implementation
* Request retries and dead connections handling
* Node reloading (based on cluster state) on errors or on demand
* Consistent API support for the whole OpenSearch API
* Extensive documentation and examples
* Emphasis on modularity and extendability of both the client and API libraries

## Compatibility

The OpenSearch client for Ruby is compatible with Ruby 1.9 and higher.

The client's API is compatible with OpenSearch's API versions from 1.0.0 till current.

## Installation

Install the package from [Rubygems](https://rubygems.org):

    gem install opensearch

To use an unreleased version, either add it to your `Gemfile` for [Bundler](http://gembundler.com):

    gem 'opensearch', git: 'git://github.com/opensearch-project/opensearch-ruby.git'

or install it from a source code checkout:

    git clone https://github.com/opensearch-project/opensearch-ruby
    cd opensearch-ruby/opensearch
    bundle install
    rake install

## Usage

This library is a wrapper for two separate libraries:

* [`opensearch-transport`](https://github.com/opensearch-project/opensearch-ruby/tree/main/opensearch-transport),
  which provides a low-level Ruby client for connecting to an [OpenSearch](http://opensearch.com) cluster
* [`opensearch-api`](https://github.com/opensearch-project/opensearch-ruby/tree/main/opensearch-api),
  which provides a Ruby API for the OpenSearch RESTful API

Install the `opensearch` package and use the API directly:

```ruby
require 'opensearch'

client = OpenSearch::Client.new log: true

client.cluster.health

client.transport.reload_connections!

client.search q: 'test'

# etc.
```

Please refer to the specific library documentation for details:

* **Transport**:
   [[README]](https://github.com/opensearch-project/opensearch-ruby/blob/main/opensearch-transport/README.md)

* **API**:
   [[README]](https://github.com/opensearch-project/opensearch-ruby/blob/main/opensearch-api/README.md)

## Development

You can run `rake -T` to check the test tasks. Use `COVERAGE=true` before running a test task to check the coverage with Simplecov.

## License

This software is licensed under the [Apache 2 license](./LICENSE).
