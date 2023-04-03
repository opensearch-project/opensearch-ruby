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

describe OpenSearch::DSL::Search::Queries::Term do
  describe '#to_hash' do
    let(:search) do
      described_class.new
    end

    it 'can be converted to a hash' do
      expect(search.to_hash).to eq(term: {})
    end
  end

  describe '#initialize' do
    context 'when a String is provided' do
      let(:search) do
        described_class.new(message: 'test')
      end

      it 'executes the block' do
        expect(search.to_hash[:term][:message]).to eq('test')
      end
    end

    context 'when a hash is provided' do
      let(:search) do
        described_class.new(message: { query: 'test', boost: 2 })
      end

      it 'sets the value' do
        expect(search.to_hash[:term][:message]).to eq(query: 'test', boost: 2)
      end
    end
  end
end
