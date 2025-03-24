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
        # Cancels a task, if it can be cancelled through an API.
        #
        # @option args [Enumerable<String>, String] :actions A comma-separated list of actions that should be returned. Keep empty to return all.
        # @option args [Enumerable<String>] :nodes A comma-separated list of node IDs or names used to limit the returned information. Use `_local` to return information from the node you're connecting to, specify the node name to get information from a specific node, or keep the parameter empty to get information from all nodes.
        # @option args [String] :parent_task_id Returns tasks with a specified parent task ID (`node_id:task_number`). Keep empty or set to -1 to return all.
        # @option args [Boolean] :wait_for_completion Waits for the matching task to complete. When `true`, the request is blocked until the task has completed.
        # @option args [String] :task_id The task ID.
        def cancel(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _task_id = args.delete('task_id')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = Utils.build_url('_tasks', _task_id, '_cancel')

          Utils.validate_query_params! args, CANCEL_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        CANCEL_QUERY_PARAMS = Set.new(%w[
          actions
          nodes
          parent_task_id
          wait_for_completion
        ]).freeze
      end
    end
  end
end
