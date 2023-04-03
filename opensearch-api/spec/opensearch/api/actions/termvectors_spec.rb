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

describe 'client#termvectors' do
  let(:expected_args) do
    [
      'POST',
      url,
      params,
      body,
      {}
    ]
  end

  let(:url) do
    'foo/_termvectors/123'
  end

  let(:params) do
    {}
  end

  let(:body) do
    {}
  end

  let(:client) do
    Class.new { include OpenSearch::API }.new
  end

  it 'requires the :index argument' do
    expect do
      client.termvectors(id: '1')
    end.to raise_exception(ArgumentError)
  end

  it 'performs the request' do
    expect(client_double.termvectors(index: 'foo', id: '123', body: {})).to eq({})
  end

  context 'when the older api name \'termvector\' is used' do
    let(:url) do
      'foo/_termvector/123'
    end

    it 'performs the request' do
      expect(client_double.termvector(index: 'foo', id: '123', body: {})).to eq({})
    end
  end
end
