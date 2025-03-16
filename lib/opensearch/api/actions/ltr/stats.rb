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
    module Ltr
      module Actions
        # Provides information about the current status of the LTR plugin.
        #
        # @option args [Enumerable<String>] :node_id Comma-separated list of node IDs or names to limit the returned information; use `_local` to return information from the node you're connecting to, leave empty to get information from all nodes.
        # @option args [String] :timeout The time in milliseconds to wait for a response.
        # @option args [Enumerable<String>] :stat Comma-separated list of stats to retrieve; use `_all` or empty string to retrieve all stats.
        def stats(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _node_id = args.delete('node_id')
          _stat = args.delete('stat')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_plugins/_ltr', _node_id, 'stats', _stat)

          Utils.validate_query_params! args, STATS_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        STATS_QUERY_PARAMS = Set.new(%w[
          timeout
        ]).freeze
      end
    end
  end
end
