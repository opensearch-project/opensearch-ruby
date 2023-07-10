# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.
#
# Modifications Copyright OpenSearch Contributors. See
# GitHub history for details.

# This code was generated from OpenSearch API Spec.
# Update the code generation logic instead of modifying this file directly.

# frozen_string_literal: true

require_relative '../../../../spec_helper'

describe 'client.remote_store#restore' do
  let(:expected_args) do
    [
      'POST',
      '_remotestore/_restore',
      { cluster_manager_timeout: '1m',
        wait_for_completion: true },
      {},
      {}
    ]
  end

  let(:client) do
    Class.new { include OpenSearch::API }.new
  end

  it 'requires the :body argument' do
    expect do
      client.remote_store.restore
    end.to raise_exception(ArgumentError)
  end

  it 'performs the request with all optional params' do
    expect(client_double.remote_store.restore(
      cluster_manager_timeout: '1m',
      wait_for_completion: true,
      body: {}
    )).to eq({})
  end
end
