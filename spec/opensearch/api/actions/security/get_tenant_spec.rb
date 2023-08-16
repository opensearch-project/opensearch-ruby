# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

# This code was generated from OpenSearch API Spec.
# Update the code generation logic instead of modifying this file directly.

# frozen_string_literal: true

require_relative '../../../../spec_helper'

describe 'client.security#get_tenant' do
  let(:expected_args) do
    [
      'GET',
      '_plugins/_security/api/tenants/songs',
      {},
      nil,
      {}
    ]
  end

  let(:client) do
    Class.new { include OpenSearch::API }.new
  end

  it 'requires the :tenant argument' do
    expect do
      client.security.get_tenant
    end.to raise_exception(ArgumentError)
  end

  it 'performs the request with all optional params' do
    expect(client_double.security.get_tenant(
      tenant: 'songs'
    )).to eq({})
  end
end
