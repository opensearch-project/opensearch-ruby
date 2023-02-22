- [OpenSearch::Transport](#opensearchtransport)
  - [Compatibility](#compatibility)
  - [User Guide](#user-guide)
  - [Features Overview](#features-overview)
  - [License](#license)

# OpenSearch::Transport

**This library is part of the [`opensearch-ruby`](https://github.com/opensearch-project/opensearch-ruby/) package; please refer to the [USER_GUIDE](../USER_GUIDE.md), unless you want to use this library standalone.**

The `opensearch-transport` library provides a low-level Ruby client for connecting to an [OpenSearch](https://opensearch.org) cluster.

It does not handle calling the OpenSearch API; see the [`opensearch-api`](../opensearch-api/README.md) library.

## Compatibility

See [COMPATIBILITY](../COMPATIBILITY.md).

## User Guide

See [USER_GUIDE](USER_GUIDE.md).

## Features Overview

* Pluggable logging and tracing
* Pluggable connection selection strategies (round-robin, random, custom)
* Pluggable transport implementation, customizable and extendable
* Pluggable serializer implementation
* Request retries and dead connections handling
* Node reloading (based on cluster state) on errors or on demand

For optimal performance, use a HTTP library which supports persistent ("keep-alive") connections, such as [Patron](https://github.com/toland/patron) or [Typhoeus](https://github.com/typhoeus/typhoeus).
Most such HTTP libraries are used through the [Faraday](https://rubygems.org/gems/faraday) HTTP library and its [adapters](https://github.com/lostisland/awesome-faraday/#adapters).

Include the library's gem and adapter gem, and require the library and adapter in your code, and it will be automatically used.
If you don't use Bundler, you may need to require the library explicitly (like `require 'faraday/patron'`).

Currently these libraries will be automatically detected and used:
- [Patron](https://github.com/toland/patron) through [faraday-patron](https://github.com/lostisland/faraday-patron)
- [Typhoeus](https://github.com/typhoeus/typhoeus) through [faraday-typhoeus](https://github.com/dleavitt/faraday-typhoeus) for Faraday 2 or higher, or Faraday's built-in adapter for Faraday 1.
- [HTTPClient](https://rubygems.org/gems/httpclient) through [faraday-httpclient](https://github.com/lostisland/faraday-httpclient)
- [Net::HTTP::Persistent](https://rubygems.org/gems/net-http-persistent) through [faraday-net_http_persistent](https://github.com/lostisland/faraday-net_http_persistent)

**Note on [Typhoeus](https://github.com/typhoeus/typhoeus)**: You need to use v1.4.0 or up since older versions are not compatible with Faraday 1.0 or higher.

**Note on [Faraday](https://rubygems.org/gems/faraday)**: If you use Faraday 2.0 or higher, if the adapter is in a separate gem, you will likely need to declare that gem as well. Only the Net::HTTP adapter gem is included by default. Faraday 1.x includes most common adapter gems already.

For detailed information, see example configurations [below](#transport-implementations).

## License

This software is licensed under the [Apache 2 license](./LICENSE).
