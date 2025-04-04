# Index Lifecycle
This guide covers OpenSearch Ruby Client API actions for Index Lifecycle. You'll learn how to create, read, update, and delete indices in your OpenSearch cluster. We will also leverage index templates to create default settings and mappings for indices of certain patterns.

## Setup

In this guide, we will need an OpenSearch cluster with more than one node. Let's use the sample [docker-compose.yml](https://opensearch.org/samples/docker-compose.yml) to start a cluster with two nodes. The cluster's API will be available at `localhost:9200` with basic authentication enabled with default username and password of `admin:admin`.

To start the cluster, run the following command:

```bash
cd /path/to/docker-compose.yml
docker-compose up -d
```

Let's create a client instance to access this cluster:

```ruby
require 'opensearch-ruby'

client = OpenSearch::Client.new(
  host: 'https://admin:admin@localhost:9200',
  transport_options: { ssl: { verify: false } })

puts client.info # Check server info and make sure the client is connected
```

## Index API Actions

### Create a new index
You can quickly create an index with default settings and mappings by using the `indices.create` API action. The following example creates an index named `paintings` with default settings and mappings:

```ruby
client.indices.create(index: :paintings)
```
To specify settings and mappings, you can pass them as the `body` of the request. The following example creates an index named `movies` with custom settings and mappings:

```ruby
client.indices.create(
  index: :movies,
  body: {
    settings: {
      index: {
        number_of_shards: 2,
        number_of_replicas: 1
      }
    },
    mappings: {
      properties: {
        title: { type: 'text' },
        year: { type: 'integer' }
      }
    }
  }
)
```
When you create a new document for an index, OpenSearch will automatically create the index if it doesn't exist:

```ruby
puts client.indices.exists?(index: :burner) # => false
client.create(index: :burner, body: { lorem: 'ipsum' })
puts client.indices.exists?(index: :burner) # => true
```


### Update an Index
You can update an index's settings and mappings by using the `indices.put_settings` and `indices.put_mapping` API actions. 

The following example updates the `movies` index's number of replicas to `0`:

```ruby
client.indices.put_settings(
  index: :movies,
  body: {
    index: {
      number_of_replicas: 0
    }
  }
)
```
The following example updates the `movies` index's mappings to add a new field named `director`:

```ruby
client.indices.put_mapping(
  index: :movies,
  body: {
    properties: {
      director: { type: 'text' }
    }
  }
)
```

### Get Metadata for an Index
Let's check if the index's settings and mappings have been updated by using the `indices.get` API action:

```ruby
puts client.indices.get(index: :movies)
```
The response body contains the index's settings and mappings:

```ruby
{ 
  "movies" => { 
    "aliases" => {}, 
    "mappings" => { 
        "properties" => { 
          "title" => { "type" => "text" }, 
          "year" => { "type" => "integer" },
          "director" => { "type" => "text" } 
        } 
    }, 
    "settings" => { 
      "index" => { 
        "creation_date" => "1680297372024", 
        "number_of_shards" => "2", 
        "number_of_replicas" => "0", 
        "uuid" => "FEDWXgmhSLyrCqWa8F_aiA", 
        "version" => { "created" => "136277827" }, 
        "provided_name" => "movies" 
      } 
    }
  } 
}  
```
### Delete an Index
Let's delete the `movies` index by using the `indices.delete` API action:

```ruby
client.indices.delete(index: :movies)
```
We can also delete multiple indices at once:

```ruby
client.indices.delete(index: [:movies, :paintings, :burner])
```
By default, the `indices.delete` action is not idempotent. If you try to delete an index that does not exist, or delete the same indices twice, you will run into 404/NotFound error. You can make the `indices.delete` action idempotent across the client instance. Check the [Idempotent Delete](idempotent_delete.md) guide for more information.

## Cleanup

All resources created in this guide are automatically deleted when the cluster is stopped. You can stop the cluster by running the following command:

```bash
docker-compose down
```
