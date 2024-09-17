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
    module Indices
      module Actions
        # Returns information about ongoing index shard recoveries.
        #
        # @option args [Boolean] :active_only If `true`, the response only includes ongoing shard recoveries.
        # @option args [Boolean] :detailed If `true`, the response includes detailed information about shard recoveries.
        # @option args [Enumerable<String>, String] :index Comma-separated list of data streams, indexes, and aliases used to limit the request. Supports wildcards (`*`). To target all data streams and indexes, omit this parameter or use `*` or `_all`.
        def recovery(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url(_index, '_recovery')

          Utils.validate_query_params! args, RECOVERY_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        RECOVERY_QUERY_PARAMS = Set.new(%w[
          active_only
          detailed
        ]).freeze
      end
    end
  end
end
