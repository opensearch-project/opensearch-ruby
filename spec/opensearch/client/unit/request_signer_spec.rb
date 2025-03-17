# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.
#
# Modifications Copyright OpenSearch Contributors. See
# GitHub history for details.

require_relative '../../../spec_helper'

describe OpenSearch::Client do
  let(:logger) { instance_double(Logger, info: nil) }
  let(:signer) do
    Struct.new(:signer) do
      def self.sign_request(args)
        args[:logger].info("Request signed: #{args[:url]}")
        args[:headers].merge(dummy_header1: args[:body], dummy_header2: args[:params], dummy_header3: args[:host])
      end
    end
  end

  let(:client) do
    described_class.new(
      host: 'http://localhost:9200',
      transport_options: { ssl: { verify: false } },
      logger: logger,
      request_signer: signer
    ).tap do |cli|
      allow(cli.transport.transport).to receive(:perform_request).and_return({ body: 'Response Body' })
    end
  end

  it 'sign the headers' do
    client.transport.perform_request('GET', 'hello/world', { query: 'string' }, { request: :body }, { header1: 'value1' })
    expect(logger).to have_received(:info).with('Request signed: http://localhost:9200/hello/world?query=string')
    expect(client.transport.transport).to have_received(:perform_request).with(
      'GET',
      'hello/world',
      { query: 'string' },
      { request: :body },
      { header1: 'value1',
        dummy_header1: { request: :body },
        dummy_header2: { query: 'string' },
        dummy_header3: 'localhost' }
    )
  end
end
