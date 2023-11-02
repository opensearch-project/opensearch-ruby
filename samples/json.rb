# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

# frozen_string_literal: true

require 'opensearch-ruby'
client = OpenSearch::Client.new(
  hosts: ['https://localhost:9200'],
  user: 'admin',
  password: 'admin',
  transport_options: { ssl: { verify: false } }
)

# Perform a GET request using http namespace
# (Retrieve a summary of all indices)
puts client.http.get('_cat/indices')

# Perform a PUT request with body, query-string params, and headers using http namespace
# (Create an index called 'books' with 5 shards and 2 replicas)
body = { settings: { number_of_shards: 5, number_of_replicas: 2 } }
params = { timeout: '30s' }
headers = { 'Content-Type' => 'application/json' }

client.http.put('books', body: body, params: params, headers: headers)

# Perform a POST request with new-line delimited JSON body using http namespace
# (Add two documents to the 'books' index via _bulk endpoint)
body = [{ index: { _index: 'books', _id: 1 } },
        { title: 'The Lion King', year: 1994 },
        { index: { _index: 'books', _id: 2 } },
        { title: 'Beauty and the Beast', year: 1991 }]

puts client.http.post('_bulk', body: body)

# Perform a DELETE request using http namespace
# (Delete the 'books' index)
client.http.delete('books')
