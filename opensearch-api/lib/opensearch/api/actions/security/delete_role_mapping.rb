# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache License, Version 2.0 (the "License")
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Modifications Copyright OpenSearch Contributors. See
# GitHub history for details.
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

module OpenSearch
  module API
    module Security
      module Actions
        # Removes role mappings.
        #
        # @option arguments [String] :name Role-mapping name
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://opensearch.org/docs/latest/security/access-control/api/#delete-role-mapping
        #
        def delete_role_mapping(arguments = {})
          raise ArgumentError, "Required argument 'name' missing" unless arguments[:name]

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = nil

          _name = arguments.delete(:name)

          method = OpenSearch::API::HTTP_DELETE
          path   = "_plugins/_security/api/rolesmapping/#{Utils.__listify(_name)}"
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

          perform_request(method, path, params, body, headers)
        end

        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:delete_role_mapping, %i[].freeze)
      end
    end
  end
end
