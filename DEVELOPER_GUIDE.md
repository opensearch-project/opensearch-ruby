- [Developer Guide](#developer-guide)
  - [Getting Started](#getting-started)
    - [Git Clone OpenSearch Ruby Repo](#git-clone-opensearch-ruby-repo)
    - [Install Prerequisites](#install-prerequisites)
    - [Integration Tests](#integration-tests)
    - [Linter](#linter)
  - [Generate API Actions](#generate-api-actions)
  - [Create a Request Signer](#create-a-request-signer)
  - [Submitting Changes](#submitting-changes)

# Developer Guide

So you want to contribute code to the OpenSearch Ruby client? Excellent! We're glad you're here. Here's what you need to do.

## Getting Started

### Git Clone OpenSearch Ruby Repo

Fork [opensearch-project/opensearch-ruby](https://github.com/opensearch-project/opensearch-ruby) and clone locally, e.g. `git clone https://github.com/[your username]/opensearch-ruby.git`.

### Install Prerequisites

- Install [ruby](https://www.ruby-lang.org/en/documentation/installation/) to continue with the development.
- Install [bundler](https://bundler.io/) to manage dependencies.
- Install all dependencies using `bundle install`.
- Install [Docker](https://docs.docker.com/install/), required for running integration tests for the repo.

### Running Tests

Tests configurations are grouped into rake tasks in `test` namespace. Integration tests require a running OpenSearch cluster:

```
export CLUSTER_VERSION=latest
export PORT=9200
export DISABLE_SECURITY=true
./.github/actions/opensearch/run.sh
```

To run all tests:
```shell
rake test:all
```

#### Unit Tests

Run all unit tests:
```shell
rake test:unit
```

Run unit tests of a specific module:
```shell
rake test:api:unit
rake test:transport:unit
rake test:dsl:unit
rake test:client:unit
```

#### Integration Tests

To run integration tests for the ruby client, start an OpenSearch cluster using docker:



Run all integration tests:
```shell
rake test:integration:all
```

run integration tests of a specific module:

```shell
rake test:api:integration
rake test:transport:integration
rake test:dsl:integration
rake test:client:integration
```

### Linter

Use Rubocop to auto-lint Ruby code.

```
rubocop -a
rubocop --auto-gen-config
```

## Generate API Actions

the [generate_api workflow](.github/workflows/generate_api.yml) runs every Sunday at 00:00 UTC to generate API actions from the latest OpenSearch REST API, and creates a PR with the changes. You can also run the workflow locally to generate API actions:
```shell
bundle exec rake download_spec
bundle exec rake generate_api
```

## Create a Request Signer

The OpenSearch ruby client supports request signing as an authentication mechanism. When instantiating a client, you can pass a request signer object to sign requests. The request signer object implements the `sign_request` method that returns a hash representing the signed headers. This method must accept the following parameters:
- `method` (String): The HTTP method of the request. (e.g. `GET`, `POST`, `PUT`, `DELETE`)
- `host` (String): The host of the request. (e.g. `localhost`)
- `path` (String): The path of the request. (e.g. `_search`, `_cluster/health`)
- `port` (Integer): The port of the request. (e.g. `9200`)
- `url` (String): The full URL of the request. (e.g. `'https://localhost:9200/_search?q=example'`)
- `params` (Hash): The query parameters of the request. (e.g. `{ 'q' => 'example' }`)
- `headers` (Hash): The headers of the request. (e.g. `{ 'Content-Type' => 'application/json' }`)
- `body` (String | Hash | NilClass): The body of the request. (e.g. `{ query: { match_all: {}}`)
- `logger` (Logger | NilClass): The logger object to log messages. (e.g. `Logger.new(STDOUT)`)

Note that you can ignore any of the parameters if they are not needed for the signing process. The following is a simple example of a request signer implementation:

```ruby
class MyRequestSigner
  def initialize(public_key, private_key)
    @public_key = public_key
    @private_key = private_key
  end

  def sign_request(method:, host:, path:, port:, url:, params:, headers:, body:, logger:)
    logger&.info("Signing request: #{method} #{url}")
    signed_headers = headers.merge({
      'X-Date' => Time.now.utc.strftime('%Y%m%dT%H%M%SZ'),
      'X-public_key' => @public_key,
      'X-Hash' => OpenSSL::HMAC.hexdigest('sha256', @private_key, body.to_s)
    })
    logger?.debug("Signed headers: #{signed_headers}")
    signed_headers
  end
end
```

## Submitting Changes

See [CONTRIBUTING](CONTRIBUTING.md).

## Transport Layer Architecture

* {OpenSearch::Transport::Client} is composed of {OpenSearch::Transport::Transport}

* {OpenSearch::Transport::Transport} is composed of {OpenSearch::Transport::Transport::Connections}, and an instance of logger, tracer, serializer and sniffer.

* Logger and tracer can be any object conforming to Ruby logging interface, i.e. an instance of [`Logger`](http://www.ruby-doc.org/stdlib-1.9.3/libdoc/logger/rdoc/Logger.html), [_log4r_](https://rubygems.org/gems/log4r), [_logging_](https://github.com/TwP/logging/), etc.

* The {OpenSearch::Transport::Transport::Serializer::Base} implementations handle converting data for OpenSearch (e.g. to JSON). You can implement your own serializer.

* {OpenSearch::Transport::Transport::Sniffer} allows to discover nodes in the cluster and use them as connections.

* {OpenSearch::Transport::Transport::Connections::Collection} is composed of {OpenSearch::Transport::Transport::Connections::Connection} instances and a selector instance.

* {OpenSearch::Transport::Transport::Connections::Connection} contains the connection attributes such as hostname and port, as well as the concrete persistent "session" connected to a specific node.

* The {OpenSearch::Transport::Transport::Connections::Selector::Base} implementations allow to choose connections from the pool, e.g. in a round-robin or random fashion. You can implement your own selector strategy.
