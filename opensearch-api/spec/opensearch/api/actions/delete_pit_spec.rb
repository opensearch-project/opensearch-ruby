# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.
#
# Modifications Copyright OpenSearch Contributors. See
# GitHub history for details.

require 'spec_helper'

describe 'client#delete_pit' do
  let(:expected_args) do
    [
      'DELETE',
      '_search/point_in_time',
      {},
      { pit_id: ['abc'] }
    ]
  end

  let(:client) do
    Class.new { include OpenSearch::API }.new
  end

  it 'requires the :body argument' do
    expect {
      client.delete_pit
    }.to raise_exception(ArgumentError)
  end

  it 'does not accept unregistered params' do
    expect {
      client.delete_pit(body: {}, something: :else)
    }.to raise_exception(ArgumentError)
  end

  it 'performs the request with all optional params' do
    expect(client_double.delete_pit(body: { pit_id: ['abc'] })).to eq({})
  end
end
