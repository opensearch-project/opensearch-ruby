- [User Guide](#user-guide)
  - [Setup](#setup)
  - [Basic Usage](#basic-usage)
  - [OpenSearch DSL](#opensearch-dsl)
  - [Guides by Topics](#guides-by-topics)
  - [Using a Request Signer](#using-a-request-signer)
  - [Amazon OpenSearch Service](#amazon-opensearch-service)

# User Guide
## Setup

To add the client to your project, install it using [RubyGems](https://rubygems.org/):

`gem install opensearch-ruby`

or add it to your Gemfile:
```ruby
gem 'opensearch-ruby'
```
and run:
```
bundle install
```

Import the client:

```ruby
require 'opensearch-ruby'
```

## Basic Usage
```ruby
require 'opensearch-ruby'

client = OpenSearch::Client.new(
  host: 'https://localhost:9200',
  user: 'admin',
  password: 'admin',
  transport_options: { ssl: { verify: false } }  # For testing only. Use certificate for validation.
)

# Create an index with non-default settings
index_name = 'ruby-test-index'
index_body = {
  'settings': {
    'index': {
      'number_of_shards': 4
    }
  }
}

puts 'Creating index'
response = client.indices.create(
  index: index_name,
  body: index_body
)
puts response


# Add a document to the index
document = {
  'title': 'Moneyball',
  'director': 'Bennett Miller',
  'year': '2011'
}
id = '1'

puts 'Adding document'
response = client.index(
  index: index_name,
  body: document,
  id: id,
  refresh: true
)
puts response

# Search for the document
q = 'miller'
query = {
  'size': 5,
  'query': {
    'multi_match': {
      'query': q,
      'fields': ['title^2', 'director']
    }
  }
}

puts 'Search results'
response = client.search(
  body: query,
  index: index_name
)
puts response


# Delete the document
puts 'Deleting document'
response = client.delete(
  index: index_name,
  id: id
)
puts response

# Delete the index
puts 'Deleting index'
response = client.indices.delete(
  index: index_name
)
puts response   
```

## OpenSearch DSL

The `opensearch-dsl` library is designed as a group of standalone Ruby modules, classes and DSL methods, which provide an idiomatic way to build complex search definitions

```ruby
require 'opensearch-ruby'
require 'opensearch-dsl'
include OpenSearch::DSL

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
```

## Guides by Topics
- [Index Lifecycle](guides/index_lifecycle.md)
- [Document Lifecycle](guides/document_lifecycle.md)
- [Search](guides/search.md)
- [Bulk](guides/bulk.md)
- [Advanced Index Actions](guides/advanced_index_actions.md)
- [Index Templates](guides/index_template.md)
- [Transport Options](guides/transport_options.md)
- [Custom HTTP Requests](guides/json.md)


## Using a Request Signer
The OpenSearch ruby client supports request signing as an authentication mechanism. When instantiating a client, you can pass a request signer object to sign requests. This object is often created via a 3rd party library such as `opensearch-aws-sigv4`, but you can also create your own (Check the [DEVELOPER_GUIDE](./DEVELOPER_GUIDE.md) for more details). Below is a very simple example of a request signer object that simply signs the request with a timestamp:

```ruby
require 'opensearch-ruby'

client = OpenSearch::Client.new(
  host: 'https://localhost:9200',
  request_signer: Struct.new(:signer) do
    def self.sign_request(**args)
      args[:headers].merge({ 'X-signature' => Time.now.utc })
    end
  end
)
```

## Amazon OpenSearch Service

Requests to [OpenSearch Service and OpenSearch Serverless](https://docs.aws.amazon.com/opensearch-service/index.html) must be signed using the AWS signing protocol. The `opensearch-aws-sigv4` gem provides a request signer object that can be passed to the `OpenSearch::Client` during instantiation to sign requests.

For more information, checkout the [USER_GUIDE](https://github.com/opensearch-project/opensearch-ruby-aws-sigv4/blob/main/USER_GUIDE.md) of [opensearch-aws-sigv4 gem](https://github.com/opensearch-project/opensearch-ruby-aws-sigv4).
