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
        # Retrieves information about users in the native realm and built-in users.
        #
        # @option arguments [List] :username A comma-separated list of usernames
        # @option arguments [Boolean] :with_profile_uid flag to retrieve profile uid (if exists) associated to the user
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://opensearch.org/docs/latest/security/access-control/api/#get-user
        #
        def get_user(arguments = {})
          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = nil

          _username = arguments.delete(:username)

          method = OpenSearch::API::HTTP_GET
          path   = if _username
                     "_plugins/_security/api/internalusers/#{Utils.__listify(_username)}"
                   else
                     "_plugins/_security/api/internalusers"
                   end
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

          if Array(arguments[:ignore]).include?(404)
            Utils.__rescue_from_not_found {
              perform_request(method, path, params, body, headers)
            }
          else
            perform_request(method, path, params, body, headers)
          end
        end

        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:get_user, %i[
          with_profile_uid
        ].freeze)
      end
    end
  end
end
