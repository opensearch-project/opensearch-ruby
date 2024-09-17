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
    module Ism
      module Actions
        # Gets a policy.
        #
        # @option args [String] :policy_id *Required*
        def get_policy(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'policy_id' missing" if args['policy_id'].nil?

          _policy_id = args.delete('policy_id')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_plugins/_ism/policies', _policy_id)

          Utils.validate_query_params! args
          transport.perform_request(method, url, args, body, headers).body
        end
      end
    end
  end
end
