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
    module Root
      module Actions
        # Creates point in time context.
        #
        # @option args [Enumerable<String>] :index *Required* A comma-separated list of indexes; use `_all` or empty string to perform the operation on all indexes.
        # @option args [Boolean] :allow_partial_pit_creation Allow if point in time can be created with partial failures.
        # @option args [Enumerable<String>, String] :expand_wildcards Whether to expand wildcard expression to concrete indexes that are open, closed or both.
        # @option args [String] :keep_alive Specify the keep alive for point in time.
        # @option args [String] :preference (default: random) Specify the node or shard the operation should be performed on.
        # @option args [Enumerable<String>, String] :routing A comma-separated list of specific routing values.
        def create_pit(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'index' missing" if args['index'].nil?

          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = Utils.build_url(_index, '_search/point_in_time')

          Utils.validate_query_params! args, CREATE_PIT_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        CREATE_PIT_QUERY_PARAMS = Set.new(%w[
          allow_partial_pit_creation
          expand_wildcards
          keep_alive
          preference
          routing
        ]).freeze
      end
    end
  end
end
