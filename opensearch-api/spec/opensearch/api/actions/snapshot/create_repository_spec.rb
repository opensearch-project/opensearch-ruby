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

describe 'client.snapshot#create_repository' do
  let(:expected_args) do
    [
      'PUT',
      '_snapshot/foo',
      {},
      {},
      {}
    ]
  end

  let(:client) do
    Class.new { include OpenSearch::API }.new
  end

  it 'requires the :body argument' do
    expect do
      client.snapshot.create_repository(repository: 'foo')
    end.to raise_exception(ArgumentError)
  end

  it 'requires the :repository argument' do
    expect do
      client.snapshot.create_repository(body: {})
    end.to raise_exception(ArgumentError)
  end

  it 'performs the request' do
    expect(client_double.snapshot.create_repository(repository: 'foo', body: {})).to eq({})
  end
end
