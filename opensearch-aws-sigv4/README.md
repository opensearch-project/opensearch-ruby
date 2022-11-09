# OpenSearch Aws Sigv4 Client

The `opensearch-aws-sigv4` library provides an AWS Sigv4 client for [OpenSearch](http://opensearch.com).

## Compatibility

The OpenSearch Aws Sigv4 Client is compatible with Ruby 2.5 and higher.

The client's API is compatible with OpenSearch's API versions from 1.0.0 till current.

See [COMPATIBILITY](../COMPATIBILITY.md) for more details.

## Installation

Install the package from [Rubygems](https://rubygems.org):

    gem install opensearch-aws-sigv4

To use an unreleased version, either add it to your `Gemfile` for [Bundler](http://gembundler.com):

    gem 'opensearch-aws-sigv4', git: 'git://github.com/opensearch-project/opensearch-ruby.git'

or install it from a source code checkout:

    git clone https://github.com/opensearch-project/opensearch-ruby
    cd opensearch-ruby/opensearch-aws-sigv4
    bundle install
    rake install

## Usage

This library is an AWS Sigv4 wrapper for 
[`opensearch-ruby`](https://github.com/opensearch-project/opensearch-ruby/tree/main/opensearch),
which is a Ruby client for OpenSearch. The `OpenSearch::Aws::Sigv4Client` is, therefore, has all features of `OpenSearch::Client`.
And since `opensearch-ruby` is a dependency of `opensearch-aws-sigv4`, you only need to install `opensearch-aws-sigv4`.

```ruby
require 'opensearch-aws-sigv4'
require 'aws-sigv4'

signer = Aws::Sigv4::Signer.new(service: 'es',
                                region: 'us-west-2',
                                access_key_id: 'key_id',
                                secret_access_key: 'secret')

client = OpenSearch::Aws::Sigv4Client.new({ log: true }, signer)

client.cluster.health

client.transport.reload_connections!

client.search q: 'test'
```

Please refer to [opensearch-ruby](https://github.com/opensearch-project/opensearch-ruby/blob/main/opensearch/README.md) documentation for further details.

## Development

You can run `rake -T` to check the test tasks. Use `COVERAGE=true` before running a test task to check the coverage with Simplecov.

## License

This software is licensed under the [Apache 2 license](./LICENSE).
