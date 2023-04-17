- [Compatibility with OpenSearch](#compatibility-with-opensearch)
- [Upgrading](#upgrading)

## Compatibility with OpenSearch

The OpenSearch Ruby client is comprised of three gems:
- [`opensearch-transport`](https://rubygems.org/gems/opensearch-transport) - the transport layer
- [`opensearch-api`](https://rubygems.org/gems/opensearch-api) - the API definitions
- [`opensearch-ruby`](https://rubygems.org/gems/opensearch-ruby) - the client itself that ties the two above together

The vast majority of changes to OpenSearch are reflected in the API definitions, and the `opensearch-api` gem is updated to reflect those changes. The transport layer is updated only when there are changes to the underlying HTTP library, or when there are changes to the OpenSearch API that require changes to the transport layer. 

Below is the table of OpenSearch versions and the **recommended minimum versions** of `opensearch-api` and the corresponding `opensearch-ruby` and `opensearch-transport`:

| OpenSearch Version | `opensearch-api` Version | `opensearch-ruby` Version | `opensearch-transport` Version |
|--------------------|--------------------------|---------------------------|--------------------------------|
| 1.x                | 1.0                      | 1.0                       | 1.0                            |
| 2.1                | 2.1                      | 2.1                       | 2.0                            |
| 2.2                | 2.1                      | 2.1                       | 2.0                            |
| 2.3                | 2.1                      | 2.1                       | 2.0                            |
| 2.4                | 2.2                      | 2.1                       | 2.0                            |

## Upgrading

Major versions of OpenSearch introduce breaking changes that require careful upgrades of the client. While `opensearch-api` 2.x works against the latest OpenSearch 1.x, certain deprecated features removed in OpenSearch 2.0 have also been removed from the client. Please refer to the [OpenSearch documentation](https://opensearch.org/docs/latest/clients/index/) for more information.
