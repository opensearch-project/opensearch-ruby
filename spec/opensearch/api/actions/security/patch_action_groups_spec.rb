# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

# This code was generated from OpenSearch API Spec.
# Update the code generation logic instead of modifying this file directly.

# frozen_string_literal: true

require_relative '../../../../spec_helper'

describe 'client.security#patch_action_groups' do
  let(:expected_args) do
    [
      'PATCH',
      '_plugins/_security/api/actiongroups',
      {},
      {}
    ]
  end

  let(:client) do
    Class.new { include OpenSearch::API }.new
  end

  it 'performs the request with all optional params' do
    expect(client_double.security.patch_action_groups(
      body: {}
    )).to eq({})
  end
end
