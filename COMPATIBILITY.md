# Compatibility with OpenSearch

The below matrix shows the compatibility of the [`opensearch-ruby`](https://rubygems.org/gems/opensearch-ruby) with versions of [`OpenSearch`](https://opensearch.org/downloads.html#opensearch). In the vast majority of cases, a minor version upgrade of the OpenSearch cluster does not affect how your application's existing features interact with the cluster via the Ruby client. However, such an upgrade can introduce new endpoints that your current version of the client does not support. In this case, you must upgrade the client to the version shown in the table below (or higher) to use the new endpoints.

If your Server Version is higher than those listed in the table below, you should use the newest client. If the newest client still does not support the endpoint you need, please open an issue and let us know.

| Server Version | Client Version |
|----------------|----------------|
| 1.x            | 1.0            |
| 2.4            | 2.2            |
| 2.x            | 3.0            |
