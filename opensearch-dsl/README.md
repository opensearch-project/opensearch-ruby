- [OpenSearch::DSL](#opensearchdsl)
  - [Compatibility](#compatibility)
  - [User Guide](#user-guide)
  - [Features Overview](#features-overview)
  - [License](#license)

# OpenSearch::DSL

**This library is part of the [`opensearch-ruby`](https://github.com/opensearch-project/opensearch-ruby/) package; please refer to the [USER_GUIDE](../USER_GUIDE.md), unless you want to use this library standalone.**

The `opensearch-dsl` library provides a Ruby API for the `OpenSearch Query DSL`.

## Compatibility

See [COMPATIBILITY](../COMPATIBILITY.md).

## User Guide

See [USER_GUIDE](USER_GUIDE.md).

## Features Overview

The library allows to programatically build complex search definitions for OpenSearch in Ruby, which are translated to Hashes, and ultimately, JSON, the language of OpenSearch.

All OpenSearch DSL features are supported, namely:

* Queries and Filter context
* Aggregations
* Suggestions
* Sorting
* Pagination
* Options

## License

This software is licensed under the [Apache 2 license](./LICENSE).
