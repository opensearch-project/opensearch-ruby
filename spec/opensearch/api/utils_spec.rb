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

require_relative '../../spec_helper'

describe OpenSearch::API::Utils do
  describe '#clone_and_normalize_arguments' do
    subject(:normalized) { described_class.clone_and_normalize_arguments(arguments) }

    let(:arguments) do
      { hello: 'world',
        'hello' => 'world 2',
        hash: { bar: 'baz' },
        'number' => 42,
        string: 'amazing spider-man, big & small',
        bool: true,
        'nil' => nil,
        'array' => [1, 2, 3],
        headers: [100] }
    end

    it 'returns a new hash with keys as strings and values normalized except those of NON_URL_ARGS' do
      is_expected.to eq({
                          'hello' => 'world+2',
                          'hash' => { bar: 'baz' },
                          'number' => '42',
                          'bool' => 'true',
                          'string' => 'amazing+spider-man,+big+%26+small',
                          'nil' => '',
                          'array' => '1,2,3',
                          'headers' => [100]
                        })
    end
  end

  describe '#validate_query_params!' do
    subject(:validate) { described_class.validate_query_params!(params, Set.new(%w[foo bar])) }

    context 'when the params are valid' do
      let(:params) { { 'foo' => true, 'bar' => nil, 'human' => 'yes' } }

      it 'does not raise an error' do
        expect { validate }.not_to raise_error
      end
    end

    context 'when the params are invalid' do
      let(:params) { { 'foo' => true, 'bar' => nil, 'human' => 'yes', 'waldo' => 'hello' } }

      it 'raises an error' do
        expect { validate }.to raise_error(ArgumentError, "URL parameter 'waldo' is not supported")
      end
    end
  end

  describe '#build_url' do
    subject(:built_url) { described_class.build_url(*parts) }

    context 'when the parts has nil' do
      let(:parts) { [nil, 'foo', nil, 'bar', nil] }

      it { is_expected.to eq('foo/bar') }
    end

    context 'when the parts has multiple nils in a row' do
      let(:parts) { ['foo', nil, nil, nil, 42] }

      it { is_expected.to eq('foo/42') }
    end
  end

  describe '#bulkify' do
    context 'when the input is an array of hashes' do
      let(:result) do
        described_class.bulkify [
          { index: { _index: 'myindexA', _id: '1', data: { title: 'Test' } } },
          { update: { _index: 'myindexB', _id: '2', data: { doc: { title: 'Update' } } } },
          { delete: { _index: 'myindexC', _id: '3' } }
        ]
      end

      let(:expected_string) do
        <<-PAYLOAD.gsub(/^\s+/, '')
                {"index":{"_index":"myindexA","_id":"1"}}
                {"title":"Test"}
                {"update":{"_index":"myindexB","_id":"2"}}
                {"doc":{"title":"Update"}}
                {"delete":{"_index":"myindexC","_id":"3"}}
        PAYLOAD
      end

      it 'serializes the hashes' do
        expect(result).to eq(expected_string)
      end
    end

    context 'when the input is an array of strings' do
      let(:result) do
        described_class.bulkify(['{"foo":"bar"}', '{"moo":"bam"}'])
      end

      let(:expected_string) do
        <<-PAYLOAD.gsub(/^\s+/, '')
              {"foo":"bar"}
              {"moo":"bam"}
        PAYLOAD
      end

      it 'serializes the array of strings' do
        expect(result).to eq(expected_string)
      end
    end

    context 'when the input is an array of header/data pairs' do
      let(:result) do
        described_class.bulkify([{ foo: 'bar' }, { moo: 'bam' }, { foo: 'baz' }])
      end

      let(:expected_string) do
        <<-PAYLOAD.gsub(/^\s+/, '')
              {"foo":"bar"}
              {"moo":"bam"}
              {"foo":"baz"}
        PAYLOAD
      end

      it 'serializes the array of strings' do
        expect(result).to eq(expected_string)
      end
    end

    context 'when the payload has the :data option' do
      let(:input) do
        { index: { foo: 'bar', data: { moo: 'bam' } } }
      end

      let(:result) do
        described_class.bulkify([input])
      end

      let(:expected_string) do
        <<-PAYLOAD.gsub(/^\s+/, '')
              {"index":{"foo":"bar"}}
              {"moo":"bam"}
        PAYLOAD
      end

      it 'does not mutate the input' do
        expect(input[:index][:data]).to eq(moo: 'bam')
      end

      it 'serializes the array of strings' do
        expect(result).to eq(expected_string)
      end
    end

    context 'when the payload has nested :data options' do
      let(:data) do
        { data: { a: 'b', data: { c: 'd' } } }
      end

      let(:result) do
        described_class.bulkify([{ index: { foo: 'bar' } }, data])
      end

      let(:lines) do
        result.split("\n")
      end

      let(:header) do
        JSON.parse(lines.first)
      end

      let(:data_string) do
        JSON.parse(lines.last)
      end

      it 'does not mutate the input' do
        expect(data[:data]).to eq(a: 'b', data: { c: 'd' })
      end

      it 'serializes the array of strings' do
        expect(header['index']['foo']).to eq('bar')
        expect(data_string['data']['a']).to eq('b')
        expect(data_string['data']['data']['c']).to eq('d')
      end
    end
  end
end
