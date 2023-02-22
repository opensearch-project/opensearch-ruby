- [User Guide](#user-guide)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Development](#development)

# User Guide
## Installation

To add the gem to your project, install it using [RubyGems](https://rubygems.org/):

```
gem install opensearch-dsl
```

or add it to your Gemfile:
```
gem opensearch-dsl
```
and run:
```
bundle install
```

## Usage

The library is designed as a group of standalone Ruby modules, classes and DSL methods, which provide an idiomatic way to build complex search definitions

In addition to the examples in [USER_GUIDE](../USER_GUIDE.md),

```ruby
require 'opensearch'
require 'opensearch/dsl'
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

## Development

Use the Rake tasks to run the test suites:

```
bundle exec rake test:unit
bundle exec rake test:integration
```

To launch a separate OpenSearch server for integration tests, see instructions in the main [DEVELOPER_GUIDE](../DEVELOPER_GUIDE.md#integration-tests).
