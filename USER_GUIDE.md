- [User Guide](#user-guide)
  - [Setup](#setup)
  - [Sample code](#sample-code)
    - [Basic Usage](#basic-usage)
    - [Point in Time](#point-in-time)
  - [Amazon OpenSearch Service](#amazon-opensearch-service)

# User Guide
## Setup

To add the client to your project, install it using [RubyGems](https://rubygems.org/):

`gem install opensearch-ruby`

or add it to your Gemfile:
```
gem opensearch-ruby
```
and run:
```
bundle install
```

Import the client:

`require 'opensearch'`

## Sample code
<a name="basic-usage" /></a>
### Basic Usage
```ruby
require 'opensearch'

client = OpenSearch::Client.new(
  host: 'https://localhost:9200',
  user: 'admin',
  password: 'admin'
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

### Point in Time
Refer to OpenSearch [documentation](https://opensearch.org/docs/latest/point-in-time-api/) for more information on point in time.
```ruby
require 'opensearch-ruby'
client = OpenSearch::Client.new({ host: 'localhost' })
index = :movies
client.indices.create(index: index)

# Create 3 Pits
client.create_pit index: index, keep_alive: '3m'
client.create_pit index: index, keep_alive: '3m'
client.create_pit index: index, keep_alive: '3m'

# Get all PITs
pits = client.get_all_pits
puts pits

# Delete first PIT
client.delete_pit body: { pit_id: [pits.dig('pits', 0, 'pit_id')] }

# All PIT segments
puts client.cat.all_pit_segments

# Segments of a specific PIT
puts client.cat.pit_segments body: { pit_id: [pits.dig('pits', 1, 'pit_id')] }


# Delete all PITs
puts client.delete_all_pits
```

## Amazon OpenSearch Service

Requests to [OpenSearch Service and OpenSearch Serverless](https://docs.aws.amazon.com/opensearch-service/index.html) must be signed using the AWS signing protocol. Use `opensearch-aws-sigv4` gem in place of `opensearch-ruby` gem.

For more information, checkout the [USER_GUIDE](opensearch-aws-sigv4/USER_GUIDE.md) of [opensearch-aws-sigv4](opensearch-aws-sigv4).
