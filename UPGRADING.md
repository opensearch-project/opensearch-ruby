# Upgrading
Major versions of OpenSearch introduce breaking changes that require careful upgrades of the client. Check the [Compatibility](COMPATIBILITY.md) doc to see which version of the client should be used against your OpenSearch cluster.

### Upgrade to OpenSearch Ruby 4
OpenSearch Ruby 4 drops support for Ruby 2.x. If you are using Ruby 2.x, you should upgrade to Ruby 3.x before upgrading to OpenSearch Ruby 4.


### Upgrade to OpenSearch Ruby 3
In Version 3 of the OpenSearch Ruby client, we have added the `api` and `transport` modules as the core components of the gem, instead of treating them as separate gems that are required by the `opensearch-ruby` gem. This removes the confusions around compatibility between the ruby client, its legacy dependencies, and the OpenSearch cluster.

`opensearch-dsl` has also been moved into `opensearch-ruby` 3.0. If your application uses `opensearch-dsl`, you should now remove this gem from your Gemfile or gemspec.

We don't expect the upgrade to OpenSearch Ruby 3 to be a breaking change for the vast majority of use cases, and you do not have to make any changes to your application before the upgrade. On your development environment, you might want to perform a `bundle clean` to remove `opensearch-api`, `opensearch-transport`, and `opensearch-dsl` gems after the upgrade.

### Upgrade to OpenSearch Ruby 2
While `opensearch-ruby-client` 2.x works against the latest OpenSearch 1.x, certain deprecated features removed in OpenSearch 2.0 have also been removed from the client. So, only upgrade to `opensearch-ruby` gem to 2.x if you are also upgrading your cluster to OpenSearch 2.0.