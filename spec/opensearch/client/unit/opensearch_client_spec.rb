require_relative '../../../spec_helper'

describe 'OpenSearch::Client#respond_to_missing?' do
  it 'returns to correct results' do
    client = OpenSearch::Client.new
    expect(client.send(:respond_to_missing?, :perform_request)).to be true
    expect(client.send(:respond_to_missing?, :something_else)).to be false
  end
end
