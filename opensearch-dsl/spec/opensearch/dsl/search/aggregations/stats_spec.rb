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

describe OpenSearch::DSL::Search::Aggregations::Stats do
  let(:search) do
    described_class.new
  end

  describe '#to_hash' do
    it 'can be converted to a hash' do
      expect(search.to_hash).to eq(stats: {})
    end
  end

  describe '#initialize' do
    let(:search) do
      described_class.new(foo: 'bar')
    end

    it 'takes a hash' do
      expect(search.to_hash).to eq(stats: { foo: 'bar' })
    end

    context 'when a block is provided' do
      let(:search) do
        described_class.new do
          field 'bar'
        end
      end

      it 'executes the block' do
        expect(search.to_hash).to eq(stats: { field: 'bar' })
      end
    end
  end
end
