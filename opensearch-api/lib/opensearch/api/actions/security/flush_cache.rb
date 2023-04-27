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
        # Flushes the security plugin user, authentication, and authorization cache.
        #
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://opensearch.org/docs/latest/security/access-control/api/#flush-cache
        #
        def flush_cache(arguments = {})
          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body   = nil

          method = OpenSearch::API::HTTP_DELETE
          path   = "_plugins/_security/api/cache"
          params = {}

          perform_request(method, path, params, body, headers)
        end

        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:flush_cache, %i[].freeze)
      end
    end
  end
end
