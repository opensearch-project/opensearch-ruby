# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.
#
# Modifications Copyright OpenSearch Contributors. See
# GitHub history for details.

require 'spec_helper'

describe 'client#delete_all_pits' do
  let(:expected_args) do
    [
      'DELETE',
      '_search/point_in_time/_all',
      {},
      nil
    ]
  end

  let(:client) do
    Class.new { include OpenSearch::API }.new
  end

  it 'does not accept unregistered params' do
    expect {
      client.delete_all_pits(something: :else)
    }.to raise_exception(ArgumentError)
  end

  it 'performs the request with all optional params' do
    expect(client_double.delete_all_pits).to eq({})
  end
end
