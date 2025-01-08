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
    module Tasks
      module Actions
        # Returns a list of tasks.
        #
        # @option args [Enumerable<String>, String] :actions Comma-separated list or wildcard expression of actions used to limit the request.
        # @option args [Boolean] :detailed If `true`, the response includes detailed information about shard recoveries.
        # @option args [String] :group_by Key used to group tasks in the response.
        # @option args [Enumerable<String>] :nodes Comma-separated list of node IDs or names to limit the returned information; use `_local` to return information from the node you're connecting to, leave empty to get information from all nodes.
        # @option args [String] :parent_task_id Parent task ID used to limit returned information. To return all tasks, omit this parameter or use a value of `-1`.
        # @option args [String] :timeout Period to wait for a response. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [Boolean] :wait_for_completion If `true`, the request blocks until the operation is complete.
        def list(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = '_tasks'

          Utils.validate_query_params! args, LIST_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        LIST_QUERY_PARAMS = Set.new(%w[
          actions
          detailed
          group_by
          nodes
          parent_task_id
          timeout
          wait_for_completion
        ]).freeze
      end
    end
  end
end
