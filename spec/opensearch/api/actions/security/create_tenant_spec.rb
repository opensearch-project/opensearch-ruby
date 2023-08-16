# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

# This code was generated from OpenSearch API Spec.
# Update the code generation logic instead of modifying this file directly.

# frozen_string_literal: true

require_relative '../../../../spec_helper'

describe 'client.security#create_tenant' do
  let(:expected_args) do
    [
      'PUT',
      '_plugins/_security/api/tenants/songs',
      {},
      {}
    ]
  end

  let(:client) do
    Class.new { include OpenSearch::API }.new
  end

  it 'requires the :tenant argument' do
    expect do
      client.security.create_tenant
    end.to raise_exception(ArgumentError)
  end

  it 'performs the request with all optional params' do
    expect(client_double.security.create_tenant(
      tenant: 'songs',
      body: {}
    )).to eq({})
  end
end
