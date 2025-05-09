# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

# This file is generated from the OpenSearch REST API spec.
# Do not modify it by hand. Instead, modify the generator or the spec.

# frozen_string_literal: true

module OpenSearch
  module API
    module Security
      module Actions
        # Updates the individual attributes of an action group.
        #
        # @option args [String] :action_group *Required* The name of the action group to update.
        # @option args [Enumerable<Hash>] :body *Required*
        def patch_action_group(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'action_group' missing" if args['action_group'].nil?
          raise ArgumentError, "Required argument 'body' missing" if args['body'].nil?

          _action_group = args.delete('action_group')

          headers = (args.delete('headers') || {}).merge('Content-Type' => 'application/x-ndjson')
          body    = Utils.bulkify(args.delete('body'))
          method  = 'PATCH'
          url     = Utils.build_url('_plugins/_security/api/actiongroups', _action_group)

          Utils.validate_query_params! args
          transport.perform_request(method, url, args, body, headers).body
        end
      end
    end
  end
end
