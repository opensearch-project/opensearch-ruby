[![Integration](https://github.com/opensearch-project/opensearch-ruby/actions/workflows/main.yml/badge.svg)](https://github.com/opensearch-project/opensearch-ruby/actions/workflows/main.yml)
[![Chat](https://img.shields.io/badge/chat-on%20forums-blue)](https://discuss.opendistrocommunity.dev/c/clients/)
![PRs welcome!](https://img.shields.io/badge/PRs-welcome!-success)

![OpenSearch logo](https://raw.githubusercontent.com/opensearch-project/opensearch-ruby/main/OpenSearch.svg)

OpenSearch Ruby Client

- [Welcome!](#welcome)
- [Project Resources](#project-resources)
- [Code of Conduct](#code-of-conduct)
- [License](#license)
- [Copyright](#copyright)

## Welcome!

**opensearch-ruby** is [a community-driven, open source fork](https://aws.amazon.com/blogs/opensource/introducing-opensearch/) of elasticsearch-ruby licensed under the [Apache v2.0 License](LICENSE.txt).
For more information, see [opensearch.org](https://opensearch.org/).

## Setup

To add the client to your project, install it using [RubyGem](https://rubygems.org/)

`gem install opensearch-ruby`

or, install it from a source code checkout:
```bash
git clone https://github.com/opensearch-project/opensearch-ruby.git
cd opensearch-ruby/opensearch
gem build opensearch.gemspec
gem install opensearch-ruby-<version>.gem
```

Import the client as a module:

`require 'opensearch'`

If you prefer to add the client manually or just want to examine the source code, see [opensearch-ruby on GitHub](https://github.com/opensearch-project/opensearch-ruby).

## Sample code

```ruby
require 'opensearch'


# If you want to use authentication credentials
client = OpenSearch::Client.new(
  host: 'https://admin:admin@localhost:9200',    # For testing only. Don't store credentials in code.
  transport_options: { ssl: { verify: false } }  # For testing only. Use certificate for validation.
)

# If you don't want to use authentication credentials
#client = OpenSearch::Client.new url: 'http://localhost:9200', log: true

# Create an index with non-default settings.
index_name = 'ruby-test-index'
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
  'title': 'Moneyball',
  'director': 'Bennett Miller',
  'year': '2011'
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



# Search for the document.
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

response = client.search(
  body: query,
  index: index_name
)
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

## Project Resources

* [Project Website](https://opensearch.org/)
* [Downloads](https://opensearch.org/downloads.html).
* [Documentation](https://opensearch.org/docs/)
* Need help? Try [Forums](https://discuss.opendistrocommunity.dev/c/clients/)
* [Project Principles](https://opensearch.org/#principles)
* [Contributing to OpenSearch](CONTRIBUTING.md)
* [Maintainer Responsibilities](MAINTAINERS.md)
* [Release Management](RELEASING.md)
* [Admin Responsibilities](ADMINS.md)
* [Security](SECURITY.md)

## Code of Conduct

This project has adopted the [Amazon Open Source Code of Conduct](CODE_OF_CONDUCT.md). For more information see the [Code of Conduct FAQ](https://aws.github.io/code-of-conduct-faq), or contact [opensource-codeofconduct@amazon.com](mailto:opensource-codeofconduct@amazon.com) with any additional questions or comments.

## License

This project is licensed under the [Apache v2.0 License](LICENSE).

## Copyright

Copyright OpenSearch Contributors. See [NOTICE](NOTICE.txt) for details.
