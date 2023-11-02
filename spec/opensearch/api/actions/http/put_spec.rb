# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

# This code was generated from OpenSearch API Spec.
# Update the code generation logic instead of modifying this file directly.

# frozen_string_literal: true

require_relative '../../../../spec_helper'

describe 'client.http#put' do
  let(:expected_args) do
    [
      'PUT',
      'books',
      {},
      body,
      {}
    ]
  end

  let(:body) do
    {
      settings: {
        number_of_shards: 3,
        number_of_replicas: 2
      }
    }
  end

  it 'performs the request' do
    expect(client_double.http.put('books', body: body)).to eq({})
  end
end
