# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.
#
# Modifications Copyright OpenSearch Contributors. See
# GitHub history for details.

require_relative '../../../../spec_helper'

describe 'client.cat#all_pit_segments' do
  let(:expected_args) do
    [
      'GET',
      '_cat/pit_segments/_all',
      {},
      nil,
      {}
    ]
  end
  let(:client) do
    Class.new { include OpenSearch::API }.new
  end

  it 'does not accept unregistered params' do
    expect do
      client.cat.all_pit_segments(something: :else)
    end.to raise_exception(ArgumentError)
  end

  it 'performs the request' do
    expect(client_double.cat.all_pit_segments).to eq({})
  end
end
