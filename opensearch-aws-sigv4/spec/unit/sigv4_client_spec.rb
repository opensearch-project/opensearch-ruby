# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.
#
# Modifications Copyright OpenSearch Contributors. See
# GitHub history for details.

require_relative '../spec_helper'
require 'aws-sigv4'
require 'timecop'

describe OpenSearch::Aws::Sigv4Client do
  subject(:client) do
    OpenSearch::Aws::Sigv4Client.new(
      { host: 'http://localhost:9200',
        transport_options: { ssl: { verify: false } } },
      signer)
  end

  let(:signer) do
    Aws::Sigv4::Signer.new(service: 'es',
                           region: 'us-west-2',
                           access_key_id: 'key_id',
                           secret_access_key: 'secret')
  end

  describe '.initialize' do
    context 'when a Sigv4 Signer is NOT provided' do
      let(:signer) { nil }

      it 'raises an argument error' do
        expect { client }.to raise_error ArgumentError, 'Please pass a Aws::Sigv4::Signer. A NilClass was given.'
      end
    end

    context 'when a Sigv4 Signer is provided' do
      it 'does NOT raise any error' do
        expect { client }.to_not raise_error
      end
    end
  end

  describe '#perform_request' do
    let(:response) { { body: 'Response Body' } }
    let(:transport_double) do
      _double = instance_double('OpenSearch::Transport::Client')
      _double.stub_chain(:transport, :hosts, :dig).and_return('localhost')
      _double
    end
    let(:signed_headers) do
       {
        'authorization' => 'AWS4-HMAC-SHA256 Credential=key_id/20220101/us-west-2/es/aws4_request, '\
                           'SignedHeaders=host;x-amz-content-sha256;x-amz-date, ' \
                           'Signature=5c04a328341dbdaf5c74d329d814815fda6ea53ba1e7191cdbc4cd21df834c3f',
        'host' => 'localhost',
        'x-amz-content-sha256' => 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855',
        'x-amz-date' => '20220101T000000Z'
      }
    end

    before(:each) do
      Timecop.freeze(Time.utc(2022))
      client.transport = transport_double
    end

    after(:each) { Timecop.return }

    context 'with verified opensearch distribution' do
      before(:each) do
        client.instance_variable_set(:@verified, true)
        allow(transport_double).to receive(:perform_request).with('GET', '/_stats', {}, '', signed_headers) { response }
      end

      it 'does not verify opensearch distribution again' do
        expect(client).to_not receive(:verify_open_search)
        output = client.perform_request('GET', '/_stats', {}, '', {})
      end

      it 'signs the request before passing it to @transport' do
        expect(transport_double).to receive(:perform_request).with('GET', '/_stats', {}, '', signed_headers)
        output = client.perform_request('GET', '/_stats', {}, '', {})
        expect(output).to eq(response)
      end
    end

    context 'with unverified opensearch distribution' do
      before(:each) do
        stub_sigv4_signer = double
        allow(stub_sigv4_signer).to receive(:sign_request) { OpenStruct.new(headers: signed_headers) }
        client.sigv4_signer = stub_sigv4_signer
      end

      it 'verifies opensearch distribution' do
        verification_response = OpenStruct.new({
          headers: {},
          body: { 'version' => { 'number' => '1.0.0', 'distribution' => 'opensearch' } },
        })
        expect(transport_double).to receive(:perform_request).with('GET', '/', {}, nil, signed_headers).ordered { verification_response }
        expect(transport_double).to receive(:perform_request).with('GET', '/_stats', {}, '', signed_headers).ordered { response }
        output = client.perform_request('GET', '/_stats', {}, '', {})
      end
    end
  end
end
