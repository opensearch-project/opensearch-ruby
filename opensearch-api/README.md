# OpenSearch::API

**This library is part of the [`opensearch-ruby`](https://github.com/opensearch-project/opensearch-ruby/) package;
please refer to it, unless you want to use this library standalone.**

----

The `opensearch-api` library provides a Ruby implementation of
the [OpenSearch](http://opensearch.com) REST API.

It does not provide an OpenSearch client; see the
[`opensearch-transport`](https://github.com/opensearch-project/opensearch-ruby/tree/main/opensearch-transport) library.

The library is compatible with Ruby 1.9 and higher.

It is compatible with OpenSearch's API versions from 1.0.0 till current.

## Installation

Install the package from [Rubygems](https://rubygems.org):

    gem install opensearch-api

To use an unreleased version, either add it to your `Gemfile` for [Bundler](http://gembundler.com):

    gem 'opensearch-api', git: 'git://github.com/opensearch-project/opensearch-ruby.git'

or install it from a source code checkout:

    git clone https://github.com/opensearch-project/opensearch-ruby
    cd opensearch-ruby/opensearch-api
    bundle install
    rake install

## Usage

The library is designed as a group of standalone Ruby modules, which can be mixed into a class
providing connection to OpenSearch -- an OpenSearch client.

### Usage with the `opensearch` gem

**When you use the client from the [`opensearch-ruby`](https://github.com/opensearch-project/opensearch-ruby/) package,
the library modules have been already included**, so you just call the API methods:

```ruby
require 'opensearch'

client = OpenSearch::Client.new(log: true)

client.index(index: 'myindex', type: 'mytype', id: 1, body: { title: 'Test' })
# => {"_index"=>"myindex", ... "created"=>true}

client.search(index: 'myindex', body: { query: { match: { title: 'test' } } })
# => {"took"=>2, ..., "hits"=>{"total":5, ...}}
```

### Usage with a custom client

When you want to mix the library into your own client, it must conform to a following _contract_:

* It responds to a `perform_request(method, path, params, body, headers)` method,
* the method returns an object with `status`, `body` and `headers` methods.

A simple client could look like this (_with a dependency on `active_support` to parse the query params_):

```ruby
require 'multi_json'
require 'faraday'
require 'opensearch/api'
require 'active_support'

class MySimpleClient
  include OpenSearch::API

  CONNECTION = ::Faraday::Connection.new url: 'http://localhost:9200'

  def perform_request(method, path, params, body, headers = nil)
    puts "--> #{method.upcase} #{path} #{params} #{body} #{headers}"

    CONNECTION.run_request \
      method.downcase.to_sym,
      path_with_params(path, params),
      ( body ? MultiJson.dump(body): nil ),
      {'Content-Type' => 'application/json'}
  end
  
  private
  
  def path_with_params(path, params)
    return path if params.blank?
  
    case params
    when String
      "#{path}?#{params}"
    when Hash
      "#{path}?#{params.to_query}"
    else
      raise ArgumentError, "Cannot parse params: '#{params}'"
    end
  end
end

client = MySimpleClient.new

p client.cluster.health
# --> GET _cluster/health {}
# => "{"cluster_name":"opensearch" ... }"

p client.index index: 'myindex', type: 'mytype', id: 'custom', body: { title: "Indexing from my client" }
# --> PUT myindex/mytype/custom {} {:title=>"Indexing from my client"}
# => "{"ok":true, ... }"
```

### Using JSON Builders

Instead of passing the `:body` argument as a Ruby _Hash_, you can pass it as a _String_, potentially
taking advantage of JSON builders such as [JBuilder](https://github.com/rails/jbuilder) or
[Jsonify](https://github.com/bsiggelkow/jsonify):

```ruby
require 'jbuilder'

query = Jbuilder.encode do |json|
  json.query do
    json.match do
      json.title do
        json.query    'test 1'
        json.operator 'and'
      end
    end
  end
end

client.search index: 'myindex', body: query

# 2013-06-25 09:56:05 +0200: GET http://localhost:9200/myindex/_search [status:200, request:0.015s, query:0.011s]
# 2013-06-25 09:56:05 +0200: > {"query":{"match":{"title":{"query":"test 1","operator":"and"}}}}
# ...
# => {"took"=>21, ..., "hits"=>{"total"=>1, "hits"=>[{ "_source"=>{"title"=>"Test 1", ...}}]}}
```

### Using Hash Wrappers

For a more comfortable access to response properties, you may wrap it in one of the _Hash_ "object access"
wrappers, such as [`Hashie::Mash`](https://github.com/intridea/hashie):

```ruby
require 'hashie'

response = client.search index: 'myindex',
                         body: {
                           query: { match: { title: 'test' } },
                           aggregations: { tags: { terms: { field: 'tags' } } }
                         }

mash = Hashie::Mash.new response

mash.hits.hits.first._source.title
# => 'Test'

mash.aggregations.tags.terms.first
# => #<Hashie::Mash count=3 term="z">
```

### Using a Custom JSON Serializer

The library uses the [MultiJson](https://rubygems.org/gems/multi_json/) gem by default,
but allows you to set a custom JSON library, provided it uses the standard `load/dump`
interface:

```ruby
OpenSearch::API.settings[:serializer] = JrJackson::Json
OpenSearch::API.serializer.dump({foo: 'bar'})
# => {"foo":"bar"}
```

## Development

To work on the code, clone and bootstrap the main repository first -- please see instructions in the main [README](../README.md#development).

To run tests, launch a testing cluster -- again, see instructions in the main [README](../README.md#development) -- and use the Rake tasks:

```
time rake test:unit
time rake test:integration
```

We run the test suite for OpenSearch's Rest API tests.

The `rest_api` needs the test files from OpenSearch. You can run the rake task to download the test artifacts in the root folder of the project. This task needs a running cluster to determine which version and build hash of OpenSearch to use and test against. `TEST_OPENSEARCH_SERVER=http://localhost:9200 rake opensearch:download_artifacts`. This will download the necessary files used for the integration tests to `./tmp`.

## License

This software is licensed under the [Apache 2 license](./LICENSE).
