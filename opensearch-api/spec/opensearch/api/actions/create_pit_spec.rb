# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.
#
# Modifications Copyright OpenSearch Contributors. See
# GitHub history for details.

require 'spec_helper'

describe 'client#create_pit' do
  let(:expected_args) do
    [
      'POST',
      'movies,books/_search/point_in_time',
      { keep_alive: '1m',
        preference: :random,
        routing: :route,
        expand_wildcards: :open,
        allow_partial_pit_creation: false },
      nil
    ]
  end

  let(:client) do
    Class.new { include OpenSearch::API }.new
  end

  it 'requires the :index argument' do
    expect {
      client.create_pit(keep_alive: '1m')
    }.to raise_exception(ArgumentError)
  end

  it 'requires the :index argument' do
    expect {
      client.create_pit(index: 'movies')
    }.to raise_exception(ArgumentError)
  end

  it 'does not accept unregistered params' do
    expect {
      client.create_pit(index: 'movies', keep_alive: '1m', something: 42)
    }.to raise_exception(ArgumentError)
  end

  it 'performs the request with all optional params' do
    expect(client_double.create_pit(
      index: %w[movies books],
      keep_alive: '1m',
      preference: :random,
      routing: :route,
      expand_wildcards: :open,
      allow_partial_pit_creation: false
    )).to eq({})
  end
end
