# OpenSearch

The `opensearch` library provides a Ruby client and API for [OpenSearch](https://opensearch.org/).

## Compatibility

See [COMPATIBILITY](../COMPATIBILITY.md).

## Usage

This library is a wrapper for two separate libraries:

* [`opensearch-transport`](https://github.com/opensearch-project/opensearch-ruby/tree/main/opensearch-transport), which provides a low-level Ruby client for connecting to an OpenSearch cluster. See [TRANSPORT_README](../opensearch-transport/README.md) for more details.
* [`opensearch-api`](https://github.com/opensearch-project/opensearch-ruby/tree/main/opensearch-api), which provides a Ruby API for the OpenSearch RESTful APIs. See [API_README](../opensearch-api/README.md) for more details.

## Features Overview

* Pluggable logging and tracing
* Pluggable connection selection strategies (round-robin, random, custom)
* Pluggable transport implementation, customizable and extendable
* Pluggable serializer implementation
* Request retries and dead connections handling
* Node reloading (based on cluster state) on errors or on demand
* Consistent API support for the whole OpenSearch API
* Extensive documentation and examples
* Emphasis on modularity and extendability of both the client and API libraries

## License

This software is licensed under the [Apache 2 license](./LICENSE).
