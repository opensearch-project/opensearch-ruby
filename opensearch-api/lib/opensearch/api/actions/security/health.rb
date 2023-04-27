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
        # Checks to see if the security plugin is up and running. If you operate your cluster behind a load balancer, this operation is useful for determining node health and doesn’t require a signed request.
        #
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://opensearch.org/docs/latest/security/access-control/api/#get-user
        #
        def health(arguments = {})
          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = nil

          method = OpenSearch::API::HTTP_GET
          path   = "_plugins/_security/health"
          params = {}

          perform_request(method, path, params, body, headers)
        end

        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:health, %i[].freeze)
      end
    end
  end
end
