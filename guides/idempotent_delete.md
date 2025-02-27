# Idempotent Delete
Most OpenSearch API endpoints will return a 404/NotFound error when attempting to delete a resource that no longer exists. This means you must check if the resource exists before performing a deletion, making the delete action non-idempotent in OpenSearch. This process can be cumbersome and error-prone. The Ruby client provides the `:ignore_404_on_delete` option to make delete actions idempotent. When set to `true` (default is `false`), the client will ignore the 404 error if the resource does not exist and return `false` instead.


Let's create a client instance with the `:ignore_404_on_delete` option set to `true`:
```ruby
require 'opensearch-ruby'
client = OpenSearch::Client.new(
  host: 'https://admin:admin@localhost:9200', 
  transport_options: { ssl: { verify: false } },
  ignore_404_on_delete: true
)
```
Now you can delete a resource without checking if it exists, or delete the same resource several times without error:
```ruby
client.indices.create(index: :movies)
client.delete(index: :movies, id: 1)
client.delete(index: :movies, id: 1)
client.indices.delete(index: :movies)
client.indices.delete(index: [:moves, :books])
```