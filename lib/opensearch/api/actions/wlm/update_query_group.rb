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
    module Wlm
      module Actions
        # Updates the specified query group.
        #
        # @option args [String] :name *Required* The name of the query group.
        # @option args [Hash] :body *Required*
        def update_query_group(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'name' missing" if args['name'].nil?
          raise ArgumentError, "Required argument 'body' missing" if args['body'].nil?

          _name = args.delete('name')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'PUT'
          url     = Utils.build_url('_wlm/query_group', _name)

          Utils.validate_query_params! args
          transport.perform_request(method, url, args, body, headers).body
        end
      end
    end
  end
end