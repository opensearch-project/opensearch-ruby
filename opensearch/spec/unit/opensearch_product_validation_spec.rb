# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.
#
# Modifications Copyright OpenSearch Contributors. See
# GitHub history for details.
#
# Licensed to Elasticsearch B.V. under one or more contributor
# license agreements. See the NOTICE file distributed with
# this work for additional information regarding copyright
# ownership. Elasticsearch B.V. licenses this file to you under
# the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

require 'spec_helper'
require 'webmock/rspec'

describe 'OpenSearch: Validation' do
  let(:host) { 'http://localhost:9200' }
  let(:verify_request_stub) do
    stub_request(:get, host)
      .to_return(status: status, body: body, headers: headers)
  end
  let(:count_request_stub) do
    stub_request(:post, "#{host}/_count")
      .to_return(status: 200, body: nil, headers: {})
  end
  let(:status) { 200 }
  let(:body) { {}.to_json }
  let(:client) { OpenSearch::Client.new }
  let(:headers) do
    { 'content-type' => 'json' }
  end

  def error_requests_and_expectations(message = OpenSearch::NOT_SUPPORTED_WARNING)
    expect { client.count }.to raise_error OpenSearch::UnsupportedProductError, message
    assert_requested :get, host
    assert_not_requested :post, "#{host}/_count"
    expect { client.cluster.health }.to raise_error OpenSearch::UnsupportedProductError, message
    expect(client.instance_variable_get('@verified')).to be false
    expect { client.cluster.health }.to raise_error OpenSearch::UnsupportedProductError, message
  end

  def valid_requests_and_expectations
    expect(client.instance_variable_get('@verified')).to be false
    assert_not_requested :get, host

    client.count
    expect(client.instance_variable_get('@verified'))
    assert_requested :get, host
    assert_requested :post, "#{host}/_count"
  end

  context 'When OpenSearch replies with status 401' do
    let(:status) { 401 }
    let(:body) { {}.to_json }

    it 'Verifies the request but shows a warning' do
      stderr      = $stderr
      fake_stderr = StringIO.new
      $stderr     = fake_stderr

      verify_request_stub
      count_request_stub

      valid_requests_and_expectations

      fake_stderr.rewind
      expect(fake_stderr.string).to eq("#{OpenSearch::SECURITY_PRIVILEGES_VALIDATION_WARNING}\n")
    ensure
      $stderr = stderr
    end
  end

  context 'When Elasticsearch replies with status 403' do
    let(:status) { 403 }
    let(:body) { {}.to_json }

    it 'Verifies the request but shows a warning' do
      stderr      = $stderr
      fake_stderr = StringIO.new
      $stderr     = fake_stderr

      verify_request_stub
      count_request_stub

      valid_requests_and_expectations

      fake_stderr.rewind
      expect(fake_stderr.string).to eq("#{OpenSearch::SECURITY_PRIVILEGES_VALIDATION_WARNING}\n")
    ensure
      $stderr = stderr
    end
  end

  context 'When the OpenSearch version is 1.0.0-SNAPSHOT' do
    context 'With a valid OpenSearch response' do
      let(:body) { { 'version' => { 'number' => '1.0.0-SNAPSHOT', 'distribution' => 'opensearch' } }.to_json }
      let(:headers) do
        {
          'content-type' => 'json'
        }
      end

      it 'Makes requests and passes validation' do
        verify_request_stub
        count_request_stub

        valid_requests_and_expectations
      end
    end

    context 'When the distribution is not present' do
      let(:body) { { 'version' => { 'number' => '1.0.0-SNAPSHOT' } }.to_json }
      it 'Fails validation' do
        verify_request_stub

        expect(client.instance_variable_get('@verified')).to be false
        assert_not_requested :get, host

        error_requests_and_expectations
      end
    end
  end


  context 'When the Elasticsearch version is >= 6.0' do
    context 'With a valid Elasticsearch response' do
      let(:body) { { 'version' => { 'number' => '6.0.0' } }.to_json }
      let(:headers) do
        {
          'content-type' => 'json'
        }
      end

      it 'Makes requests and passes validation' do
        verify_request_stub
        count_request_stub

        valid_requests_and_expectations
      end
    end

  end

  context 'When the Elasticsearch version is >= 8.0.0' do
    context 'With a valid Elasticsearch response' do
      let(:body) { { 'version' => { 'number' => '8.0.0' } }.to_json }
      let(:headers) do
        {
          'content-type' => 'json'
        }
      end

      it 'Fails validation' do
        verify_request_stub
        count_request_stub

        error_requests_and_expectations
      end
    end
  end

  context 'When there is no version data' do
    let(:body) { {}.to_json }
    it 'Raises an exception and client doesnae work' do
      verify_request_stub
      error_requests_and_expectations
    end
  end

  context 'When doing a yaml content-type request' do
    let(:client) do
      OpenSearch::Client.new(transport_options: {headers: { accept: 'application/yaml', content_type: 'application/yaml' }})
    end

    let(:headers) { { 'content-type' => 'application/yaml'} }
    let(:body) { "---\nversion:\n  number: \"1.0.0-SNAPSHOT\"\n  distribution: \"opensearch\"\n" }

    it 'validates' do
      verify_request_stub
      count_request_stub
      valid_requests_and_expectations
    end
  end
end
