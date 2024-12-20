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
    module Cat
      module Actions
        # Returns information about the tasks currently executing on one or more nodes in the cluster.
        #
        # @option args [Enumerable<String>] :actions The task action names, which are used to limit the response.
        # @option args [Boolean] :detailed If `true`, the response includes detailed information about shard recoveries.
        # @option args [String] :format A short version of the Accept header (for example, `json`, `yaml`).
        # @option args [Enumerable<String>] :h Comma-separated list of column names to display.
        # @option args [Boolean] :help Return help information.
        # @option args [Enumerable<String>] :nodes Comma-separated list of node IDs or names to limit the returned information; use `_local` to return information from the node you're connecting to, leave empty to get information from all nodes.
        # @option args [String] :parent_task_id The parent task identifier, which is used to limit the response.
        # @option args [Enumerable<String>] :s Comma-separated list of column names or column aliases to sort by.
        # @option args [String] :time The unit in which to display time values.
        # @option args [Boolean] :v Verbose mode. Display column headers.
        def tasks(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = '_cat/tasks'

          Utils.validate_query_params! args, TASKS_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        TASKS_QUERY_PARAMS = Set.new(%w[
          actions
          detailed
          format
          h
          help
          nodes
          parent_task_id
          s
          time
          v
        ]).freeze
      end
    end
  end
end
