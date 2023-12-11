# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

# This code was generated from OpenSearch API Spec.
# Update the code generation logic instead of modifying this file directly.

# frozen_string_literal: true

require_relative '../../../../spec_helper'

describe 'client.http#delete' do
  let(:expected_args) do
    [
      'DELETE',
      'books',
      {},
      nil,
      { foo: :bar }
    ]
  end

  it 'performs the request' do
    expect(client_double.http.delete('books', headers: { foo: :bar })).to eq({})
  end
end
