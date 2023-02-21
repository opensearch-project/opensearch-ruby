# Developer Guide

So you want to contribute code to the OpenSearch Ruby client? Excellent! We're glad you're here. Here's what you need to do.

## Getting Started

### Git Clone OpenSearch Ruby Repo

Fork [opensearch-project/opensearch-ruby](https://github.com/opensearch-project/opensearch-ruby) and clone locally, e.g. `git clone https://github.com/[your username]/opensearch-ruby.git`.

### Install Prerequisites

Install [ruby](https://www.ruby-lang.org/en/documentation/installation/) to continue with the development.

#### Docker

Download and install [Docker](https://docs.docker.com/install/), required for running integration tests for the repo.

### Build and Test

To build and test the ruby-client:

```
rake bundle:clean
rake bundle:install
bundle exec rake test:unit
```

### Integration Tests

To run integration tests for the ruby-client, start an OpenSearch cluster using docker:

```
cd /opensearch-ruby/opensearch-ruby
export CLUSTER_VERSION=latest
export PORT=9200
export DISABLE_SECURITY=true
./../.github/actions/opensearch/run.sh
```

And run:

```
bundle exec rake test:integration
```

## Submitting Changes

See [CONTRIBUTING](CONTRIBUTING.md).