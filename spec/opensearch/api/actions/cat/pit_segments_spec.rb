# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.
#
# Modifications Copyright OpenSearch Contributors. See
# GitHub history for details.

require_relative '../../../../spec_helper'

describe 'client.cat#pit_segments' do
  let(:expected_args) do
    [
      'GET',
      '_cat/pit_segments',
      {},
      { pit_id: ['abc'] },
      {}
    ]
  end

  let(:client) do
    Class.new { include OpenSearch::API }.new
  end

  it 'requires the :body argument' do
    expect do
      client.cat.pit_segments
    end.to raise_exception(ArgumentError)
  end

  it 'does not accept unregistered params' do
    expect do
      client.cat.pit_segments(body: {}, something: :else)
    end.to raise_exception(ArgumentError)
  end

  it 'performs the request' do
    expect(client_double.cat.pit_segments(body: { pit_id: ['abc'] })).to eq({})
  end
end
