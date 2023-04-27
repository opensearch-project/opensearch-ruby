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
        # Changes the passwords of users in the native realm and built-in users.
        #
        # @option arguments [String] :username The username of the user to change the password for
        # @option arguments [Hash] :headers Custom HTTP headers
        # @option arguments [String] :password the new password for the user (*Required*)
        #
        #
        def change_password(arguments = {})
          arguments = arguments.clone
          patch_user(arguments.merge({
            username: arguments.delete(:username),
            body: {
              op: "replace",
              path: "/password",
              value: arguments.delete(:password)
            }
          }))
        end
      end
    end
  end
end
