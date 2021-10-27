# Licensed to Elasticsearch B.V. under one or more contributor
# license agreements. See the NOTICE file distributed with
# this work for additional information regarding copyright
# ownership. Elasticsearch B.V. licenses this file to you under
# the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
require 'spec_helper'
require 'logger'

describe 'OpenSearch validation integration' do
  it 'Validates for OpenSearch 1.0.0-SNAPSHOT' do
    client = OpenSearch::Client.new(
      host: OPENSEARCH_URL,
      logger: Logger.new($stderr)
    )
    expect(client.instance_variable_get('@verified')).to be false
    client.count
    expect(client.instance_variable_get('@verified')).to be true
  end
end
