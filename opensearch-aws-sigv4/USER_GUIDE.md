- [User Guide](#user-guide)
  - [Setup](#setup)
  - [Usage](#usage)
    - [Amazon OpenSearch Service](#amazon-opensearch-service)
# User Guide
## Setup

To add the gem to your project, install it using [RubyGems](https://rubygems.org/):

```
gem install opensearch-aws-sigv4
```

or add it to your Gemfile:
```
gem opensearch-aws-sigv4
```
and run:
```
bundle install
```

## Usage

This library is an AWS Sigv4 wrapper for [`opensearch-ruby`](https://github.com/opensearch-project/opensearch-ruby/tree/main/opensearch-ruby), which is a Ruby client for OpenSearch. The `OpenSearch::Aws::Sigv4Client`, therefore, has all features of `OpenSearch::Client`.

### Amazon OpenSearch Service
To sign requests for the Amazon OpenSearch Service:

```ruby
require 'opensearch-aws-sigv4'
require 'aws-sigv4'

signer = Aws::Sigv4::Signer.new(service: 'es', # signing service name, use "aoss" for OpenSearch Serverless
                                region: 'us-west-2', # signing service region
                                access_key_id: 'key_id',
                                secret_access_key: 'secret')

client = OpenSearch::Aws::Sigv4Client.new({
    host: 'https://your.amz-managed-opensearch.domain', # serverless endpoint for OpenSearch Serverless
    log: true
}, signer)

# create an index and document
index = 'prime'
client.indices.create(index: index)
client.index(index: index, id: '1', body: { name: 'Amazon Echo', 
                                            msrp: '5999', 
                                            year: 2011 })

# search for the document
client.search(body: { query: { match: { name: 'Echo' } } })

# delete the document
client.delete(index: index, id: '1')

# delete the index
client.indices.delete(index: index)
```
