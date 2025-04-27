# OpenSearch::Transport

The client supports many configurations options for setting up and managing connections, configuring logging, customizing the transport library, etc.

### Setting Hosts and Ports

To connect to a specific OpenSearch host and port:

```ruby
OpenSearch::Client.new host: 'search.myserver.com:8080'
```
*Note: The default port is `9200`.*

To connect to multiple hosts:

```ruby
OpenSearch::Client.new hosts: [ { host: 'myhost1', port: 8080 }, { host: 'myhost2', port: 8080 } ]
```

**NOTE:** When specifying multiple hosts, you probably want to enable the `retry_on_failure` option to
perform a failed request on another node (see [retry_on_failure](#retrying-on-failures)).

Common URL parts -- scheme, HTTP authentication credentials, URL prefixes, etc -- are handled automatically:

    OpenSearch::Client.new url: 'https://username:password@api.server.org:4430/search'

Another way to configure the URL(s) is to export the `OPENSEARCH_URL` variable.

The client will automatically round-robin across the hosts (unless you select or implement a different [connection selector](#connection-selector)).

### Authentication

You can pass the authentication credentials, scheme and port in the host configuration hash:

```ruby
OpenSearch::Client.new hosts: [
    { host: 'my-protected-host',
    port: '443',
    user: 'USERNAME',
    password: 'PASSWORD',
    scheme: 'https'
    } ]
```

To pass a custom certificate for SSL peer verification to Faraday-based clients, use the `transport_options` option:

```ruby
OpenSearch::Client.new url: 'https://username:password@example.com:9200',
                    transport_options: { ssl: { ca_file: '/path/to/cacert.pem' } }
```

You can also use **API Key authentication**

```ruby
OpenSearch::Client.new(
  host: host,
  transport_options: transport_options,
  api_key: credentials
)
```

Where credentials is either the base64 encoding of `id` and `api_key` joined by a colon or a hash with the `id` and `api_key`:

```ruby
OpenSearch::Client.new(
  host: host,
  transport_options: transport_options,
  api_key: {id: 'my_id', api_key: 'my_api_key'}
)
```

### Logging

To log requests and responses to standard output with the default logger (an instance of Ruby's {::Logger} class), set the `log` argument to true:

```ruby
OpenSearch::Client.new(log: true)
```

To trace requests and responses in the _Curl_ format, set the `trace` argument:

```ruby
OpenSearch::Client.new(trace: true)
```

You can customize the default logger or tracer:

```ruby
client.transport.logger.formatter = proc { |s, d, p, m| "#{s}: #{m}\n" }
client.transport.logger.level = Logger::INFO
```

Or, you can use a custom `::Logger` instance:

```ruby
OpenSearch::Client.new(logger: Logger.new(STDERR))
```

You can pass the client any conforming logger implementation:

```ruby
require 'logging' # https://github.com/TwP/logging/

log = Logging.logger['opensearch']
log.add_appenders Logging.appenders.stdout
log.level = :info

client = OpenSearch::Client.new(logger: log)
```

### Custom HTTP Headers

You can set a custom HTTP header on the client's initializer:

```ruby
client = OpenSearch::Client.new(
  transport_options: {
    headers:
      {user_agent: "My App"}
  }
)
```

You can also pass in `headers` as a parameter to any of the API Endpoints to set custom headers for the request:

```ruby
client.search(index: 'myindex', q: 'title:test', headers: {user_agent: "My App"})
```

```ruby
client = OpenSearch::Client.new
client.search(index: 'myindex', q: 'title:test', opaque_id: '123456')
```

The search request will include the following HTTP Header:
```ruby
X-Opaque-Id: 123456
```

You can also set a prefix for X-Opaque-Id when initializing the client. This will be prepended to the id you set before each request if you're using X-Opaque-Id. Example:

```ruby
client = OpenSearch::Client.new(opaque_id_prefix: 'eu-west1')
client.search(index: 'myindex', q: 'title:test', opaque_id: '123456')
```

The request will include the following HTTP Header:
```
X-Opaque-Id: eu-west1_123456
```

### Setting Timeouts

To increase the timeout, you can use the `request_timeout` parameter:

```ruby
OpenSearch::Client.new request_timeout: 5*60
```

### Connection Selector

By default, the client will rotate the connections in a round-robin fashion, using the {OpenSearch::Transport::Transport::Connections::Selector::RoundRobin} strategy. When the same client would be running in multiple processes (eg. in a Ruby web server such as Thin), it might keep connecting to the same nodes "at once". To prevent this, you can randomize the hosts collection on initialization and reloading:

```ruby
OpenSearch::Client.new hosts: ['localhost:9200', 'localhost:9201'], randomize_hosts: true
```

You can implement your own strategy to customize the behaviour. For example, let's have a "rack aware" strategy, which will prefer the nodes with a specific
attribute. Only when these would be unavailable, the strategy will use the other nodes:

```ruby
class RackIdSelector
    include OpenSearch::Transport::Transport::Connections::Selector::Base

    def select(options={})
    connections.select do |c|
        # Try selecting the nodes with a `rack_id:x1` attribute first
        c.host[:attributes] && c.host[:attributes][:rack_id] == 'x1'
    end.sample || connections.to_a.sample
    end
end

OpenSearch::Client.new hosts: ['x1.search.org', 'x2.search.org'], selector_class: RackIdSelector
```

### Retrying on Failures

To retry a failed request on a different host in case of multiple hosts:

```ruby
OpenSearch::Client.new hosts: ['localhost:9200', 'localhost:9201'], retry_on_failure: true
```

By default, the client will retry the request 3 times. You can specify how many times to retry before it raises an exception by passing a number to `retry_on_failure`:

```ruby
OpenSearch::Client.new hosts: ['localhost:9200', 'localhost:9201'], retry_on_failure: 5
```

These two parameters can also be used together:

```ruby
OpenSearch::Client.new hosts: ['localhost:9200', 'localhost:9201'], retry_on_status: [502, 503], retry_on_failure: 10
```

### Reloading Hosts

OpenSearch by default dynamically discovers new nodes in the cluster. You can leverage this in the client, and periodically check for new nodes to spread the load.

To retrieve and use the information from the Nodes Info API on every 10,000th request:

```ruby
OpenSearch::Client.new hosts: ['localhost:9200', 'localhost:9201'], reload_connections: true
```

You can pass a specific number of requests after which the reloading should be performed:

```ruby
OpenSearch::Client.new hosts: ['localhost:9200', 'localhost:9201'], reload_connections: 1_000
```

To reload connections on failures, use:

```ruby
OpenSearch::Client.new hosts: ['localhost:9200', 'localhost:9201'], reload_on_failure: true
```

The reloading will timeout if not finished under 1 second by default. To change the setting:

```ruby
OpenSearch::Client.new hosts: ['localhost:9200', 'localhost:9201'], sniffer_timeout: 3
```

*NOTE: When using reloading hosts ("sniffing") together with authentication, just pass the scheme, user and password with the host info -- or, for more clarity, in the `http` options*

```ruby
OpenSearch::Client.new host: 'localhost:9200',
                            http: { scheme: 'https', user: 'U', password: 'P' },
                            reload_connections: true,
                            reload_on_failure: true
```

### Transport Implementations

By default, the client will use the [_Faraday_](https://rubygems.org/gems/faraday) HTTP library as a transport implementation.

It will auto-detect and use an _adapter_ for _Faraday_ based on gems loaded in your code, preferring HTTP clients with support for persistent connections.

Faraday uses adapters, usually in separate gems, to connect to the HTTP library. You need to make sure that your code refers to both the HTTP library gem and the adapter gem. See this list of [Faraday adapters](https://github.com/lostisland/awesome-faraday/#adapters) for details.

To use the [_Patron_](https://github.com/toland/patron) HTTP, for example, you need to refer to these gems:

```ruby
gem 'patron'
gem 'faraday-patron'
```

If you don't use Bundler, you may need to require the libraries explicitly in your code:

```ruby
require 'patron'
require 'faraday/patron'
```

Then, create a new client, and the _Patron_  gem will be used as the "driver":

```ruby
client = OpenSearch::Client.new

client.transport.connections.first.connection.builder.adapter
# => Faraday::Adapter::Patron

10.times do
  client.nodes.stats(metric: 'http')['nodes'].values.each do |n|
    puts "#{n['name']} : #{n['http']['total_opened']}"
  end
end

# => Stiletoo : 24
# => Stiletoo : 24
# => Stiletoo : 24
# => ...
```

To use a specific adapter for _Faraday_, pass it as the `adapter` argument:

```ruby
client = OpenSearch::Client.new adapter: :net_http_persistent

client.transport.connections.first.connection.builder.handlers
# => [Faraday::Adapter::NetHttpPersistent]
```

To pass options to the [`Faraday::Connection`](https://github.com/lostisland/faraday/blob/master/lib/faraday/connection.rb) constructor, use the `transport_options` key:

```ruby
client = OpenSearch::Client.new transport_options: {
    request: { open_timeout: 1 },
    headers: { user_agent:   'MyApp' },
    params:  { :format => 'yaml' },
    ssl:     { verify: false }
}
```

To configure the _Faraday_ instance directly, use a block:

```ruby
client = OpenSearch::Client.new(host: 'localhost', port: '9200') do |f|
    f.response :logger
    f.adapter  :patron
end
```

You can use any standard Faraday middleware and plugins in the configuration block. You can also initialize the transport class yourself, and pass it to the client constructor as the `transport` argument:

```ruby
transport_configuration = lambda do |f|
  f.response :logger
  f.adapter  :patron
end

transport = OpenSearch::Transport::Transport::HTTP::Faraday.new \
  hosts: [ { host: 'localhost', port: '9200' } ],
  &transport_configuration

# Pass the transport to the client
#
client = OpenSearch::Client.new transport: transport
```


Instead of passing the transport to the constructor, you can inject it at run time:

```ruby
# Set up the transport
#
faraday_configuration = lambda do |f|
    f.instance_variable_set :@ssl, { verify: false }
    f.adapter :excon
end

faraday_client = OpenSearch::Transport::Transport::HTTP::Faraday.new \
    hosts: [ { host: 'my-protected-host',
                port: '443',
                user: 'USERNAME',
                password: 'PASSWORD',
                scheme: 'https'
            }],
    &faraday_configuration

# Create a default client
#
client = OpenSearch::Client.new

# Inject the transport to the client
#
client.transport = faraday_client
```

You can also use a bundled [_Curb_](https://rubygems.org/gems/curb) based transport implementation:

```ruby
require 'curb'
require 'opensearch/transport/transport/http/curb'

client = OpenSearch::Client.new transport_class: OpenSearch::Transport::Transport::HTTP::Curb

client.transport.connections.first.connection
# => #<Curl::Easy http://localhost:9200/>
```

It's possible to customize the _Curb_ instance by passing a block to the constructor as well (in this case, as an inline block):

```ruby
transport = OpenSearch::Transport::Transport::HTTP::Curb.new \
    hosts: [ { host: 'localhost', port: '9200' } ],
    & lambda { |c| c.verbose = true }

client = OpenSearch::Client.new transport: transport
```

You can write your own transport implementation easily, by including the {OpenSearch::Transport::Transport::Base} module, implementing the required contract, and passing it to the client as the `transport_class` parameter -- or injecting it directly.

### Serializer Implementations

By default, the [json](https://rubygems.org/gems/json) library is used as the serializer implementation.

The serialization component is pluggable, though, so you can write your own by including the {OpenSearch::Transport::Transport::Serializer::Base} module, implementing the required contract, and passing it to the client as the `serializer_class` or `serializer` parameter.

### Exception Handling

The library defines a [number of exception classes](../lib/opensearch/transport/transport/errors.rb) for various client and server errors, as well as unsuccessful HTTP responses, making it possible to `rescue` specific exceptions with desired granularity.

The highest-level exception is {OpenSearch::Transport::Transport::Error} and will be raised for any generic client *or* server errors.

{OpenSearch::Transport::Transport::ServerError} will be raised for server errors only.

As an example for response-specific errors, a `404` response status will raise an {OpenSearch::Transport::Transport::Errors::NotFound} exception.

Finally, {OpenSearch::Transport::Transport::SnifferTimeoutError} will be raised when connection reloading ("sniffing") times out.
