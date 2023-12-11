# Making raw HTTP requests

The OpenSearch client implements many high-level REST DSLs that invoke OpenSearch APIs. However, you may find yourself in a situation that requires you to invoke an API that is not supported by the client. In this case, you can use raw HTTP requests to invoke any OpenSearch API. This guide shows you different ways to make custom API calls using the OpenSearch Ruby client.

## Setup
First, create a client instance with the following code to connect to a local OpenSearch cluster using default security credentials:

```ruby
require 'opensearch-ruby'
client = OpenSearch::Client.new(
  hosts: ['https://localhost:9200'],
  user: 'admin',
  password: 'admin',
  transport_options: { ssl: { verify: false } }
)
```

## The http Namespace

The `http` namespace provides a method of every HTTP verb (GET, POST, HEAD...). Normally, to get a summary of all indices in the cluster, you would use `client.cat.indices`. However, you can achieve the same result using `client.http.get`:

```ruby
puts client.http.get('_cat/indices')
```

Of course, you can also pass query-string parameters, headers, and a request body to the `http` methods. For example, the following block of code creates an index named `movies` with 5 shards and 2 replicas, with explicit timeout of 30 seconds, and content-type of `application/json`:

```ruby
body = { settings: { number_of_shards: 5, number_of_replicas: 2 } }
params = { timeout: '30s' }
headers = { 'Content-Type' => 'application/json' }

client.http.put('movies', body: body, params: params, headers: headers)
```

If you provide the http method with a string as body, it will be sent to the server as is. However, you can also provide them with a Ruby hash or an array of hashes, and the client will convert them to a JSON string or a newline-delimited JSON (NDJSON) string respectively. For example, to create two documents in the `books` index using the `bulk` endpoint:

```ruby
body = [{ index: { _index: "books", _id: 1 } },
        { title: "The Lion King", year: 1994 },
        { index: { _index: "books", _id: 2 } },
        { title: "Beauty and the Beast", year: 1991 }]

client.http.post('_bulk', body: body)
```

Let's clean up and delete the `movies` index:

```ruby
client.http.delete('movies')
```

The `http` namespace includes the following methods:
- get
- put
- post
- delete
- head
- options
- patch
- trace
- connect
