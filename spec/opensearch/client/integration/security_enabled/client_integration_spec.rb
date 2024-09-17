# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.
#
# Modifications Copyright OpenSearch Contributors. See
# GitHub history for details.

# rubocop:disable RSpec/MultipleExpectations, RSpec/ExampleLength
require_relative '../../../../spec_helper'
require 'logger'

context 'OpenSearch client with security plugin enabled' do
  let(:logger) { Logger.new($stderr) }

  let(:client) do
    OpenSearch::Client.new(
      host: OPENSEARCH_URL,
      logger: logger,
      transport_options: { ssl: { verify: false } }
    )
  end

  context 'Integrates with opensearch API' do
    it 'performs the API methods' do
      # Ping the cluster
      expect(client.ping).to be_truthy

      # Delete the index if it exists
      client.indices.delete(index: 'movies') if client.indices.exists(index: 'movies')

      # Create index movies with settings and mappings
      client.indices.create(
        index: 'movies',
        body: {
          settings: {
            number_of_shards: 1,
            number_of_replicas: 0
          },
          mappings: {
            properties: {
              title: { type: 'text' },
              director: { type: 'text' },
              year: { type: 'date' }
            }
          }
        }
      )

      # Check if the created index has the correct settings and mappings
      index_settings = client.indices.get_settings(index: 'movies')
      expect(index_settings['movies']['settings']['index']['number_of_shards']).to eq '1'
      expect(index_settings['movies']['settings']['index']['number_of_replicas']).to eq '0'

      index_mappings = client.indices.get_mapping(index: 'movies')
      expect(index_mappings['movies']['mappings']['properties']['title']['type']).to eq 'text'
      expect(index_mappings['movies']['mappings']['properties']['director']['type']).to eq 'text'
      expect(index_mappings['movies']['mappings']['properties']['year']['type']).to eq 'date'

      # Index a document
      client.index(index: 'movies', id: 1, body: { title: 'Test 1', director: 'Director', year: '2020-01-01' })

      # Bulk index 3 documents
      client.bulk(
        index: 'movies',
        body: [
          { index: { _id: 2, data: { title: 'Test 2', director: 'Director 2', year: '2020-01-02' } } },
          { index: { _id: 3, data: { title: 'OpenSearch 3', director: 'Director 3', year: '2020-01-03' } } },
          { index: { _id: 4, data: { title: 'OpenSearch 4', director: 'Director 4', year: '2020-01-04' } } }
        ]
      )

      # Refresh the index
      client.indices.refresh(index: 'movies')

      # Search
      response = client.search(index: 'movies', body: { query: { match: { title: 'Test' } } })

      expect(response['hits']['total']['value']).to eq 2
      expect(response['hits']['hits'][0]['_source']['title']).to eq 'Test 1'

      # Delete the index
      client.indices.delete(index: 'movies')

      # Execute delete index without providing index name
      expect { client.indices.delete }.to raise_error 'Required argument \'index\' missing'

      # Delete a non-existent index without ignoring 404
      expect { client.indices.delete(index: 'movies') }.to raise_error(OpenSearch::Transport::Transport::Errors::NotFound)

      # Delete a non-existent index ignoring 404
      expect(client.indices.delete(index: 'movies', ignore: [404])).to be_falsey

      # Using unsupported query parameter
      expect { client.ping(invalid: 'invalid') }.to raise_error 'URL parameter \'invalid\' is not supported'

      # Create, get, and delete an index with HTTP methods
      client.http.put('books', body: { settings: { number_of_shards: 1, number_of_replicas: 0 } })
      expect(client.http.get('books')['books']['settings']['index']['number_of_shards']).to eq '1'
      expect(client.http.delete('books')).to be_truthy
    end
  end
end
# rubocop:enable RSpec/MultipleExpectations, RSpec/ExampleLength
