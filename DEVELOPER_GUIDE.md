- [Developer Guide](#developer-guide)
  - [Getting Started](#getting-started)
    - [Git Clone OpenSearch Ruby Repo](#git-clone-opensearch-ruby-repo)
    - [Install Prerequisites](#install-prerequisites)
      - [Docker](#docker)
    - [Build and Test](#build-and-test)
    - [Integration Tests](#integration-tests)
    - [Linter](#linter)
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

Use RuboCop to auto-lint Ruby code.

```
rubocop -a
rubocop --auto-gen-config
```

## Submitting Changes

See [CONTRIBUTING](CONTRIBUTING.md).

## Transport Layer Architecture

* {OpenSearch::Transport::Client} is composed of {OpenSearch::Transport::Transport}

* {OpenSearch::Transport::Transport} is composed of {OpenSearch::Transport::Transport::Connections}, and an instance of logger, tracer, serializer and sniffer.

* Logger and tracer can be any object conforming to Ruby logging interface, ie. an instance of [`Logger`](http://www.ruby-doc.org/stdlib-1.9.3/libdoc/logger/rdoc/Logger.html), [_log4r_](https://rubygems.org/gems/log4r), [_logging_](https://github.com/TwP/logging/), etc.

* The {OpenSearch::Transport::Transport::Serializer::Base} implementations handle converting data for OpenSearch (eg. to JSON). You can implement your own serializer.

* {OpenSearch::Transport::Transport::Sniffer} allows to discover nodes in the cluster and use them as connections.

* {OpenSearch::Transport::Transport::Connections::Collection} is composed of {OpenSearch::Transport::Transport::Connections::Connection} instances and a selector instance.

* {OpenSearch::Transport::Transport::Connections::Connection} contains the connection attributes such as hostname and port, as well as the concrete persistent "session" connected to a specific node.

* The {OpenSearch::Transport::Transport::Connections::Selector::Base} implementations allow to choose connections from the pool, eg. in a round-robin or random fashion. You can implement your own selector strategy.
