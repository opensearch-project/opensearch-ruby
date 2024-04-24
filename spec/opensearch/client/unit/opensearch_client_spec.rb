# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.
#
# Modifications Copyright OpenSearch Contributors. See
# GitHub history for details.

require_relative '../../../spec_helper'

describe 'OpenSearch::Client#respond_to_missing?' do
  it 'returns to correct results' do
    client = OpenSearch::Client.new
    expect(client.send(:respond_to_missing?, :perform_request)).to be true
    expect(client.send(:respond_to_missing?, :something_else)).to be false
  end
end
