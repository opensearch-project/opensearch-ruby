# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.
#
# Modifications Copyright OpenSearch Contributors. See
# GitHub history for details.

require 'spec_helper'

describe 'client.cat#cluster_manager' do
  let(:expected_args) do
    [
      'GET',
      '_cat/cluster_manager',
      {},
      nil,
      {}
    ]
  end

  it 'performs the request' do
    expect(client_double.cat.cluster_manager).to eq({})
  end
end
