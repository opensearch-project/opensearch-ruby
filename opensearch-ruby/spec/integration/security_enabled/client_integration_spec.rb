# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.
#
# Modifications Copyright OpenSearch Contributors. See
# GitHub history for details.
require 'spec_helper'
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
    it 'should perform the API methods' do
      expect do
        # Index a document
        client.index(index: 'test-index', id: '1', body: { title: 'Test' })

        # Refresh the index
        client.indices.refresh(index: 'test-index')

        # Search
        response = client.search(index: 'test-index', body: { query: { match: { title: 'test' } } })

        expect(response['hits']['total']['value']).to eq 1
        expect(response['hits']['hits'][0]['_source']['title']).to eq 'Test'

        # Delete the index
        client.indices.delete(index: 'test-index')
      end.not_to raise_error
    end
  end
end
