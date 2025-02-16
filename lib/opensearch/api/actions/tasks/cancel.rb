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
        # @option args [Enumerable<String>, String] :actions Comma-separated list or wildcard expression of actions used to limit the request.
        # @option args [Enumerable<String>] :nodes Comma-separated list of node IDs or names used to limit the request.
        # @option args [String] :parent_task_id Parent task ID used to limit the tasks.
        # @option args [Boolean] :wait_for_completion Should the request block until the cancellation of the task and its descendant tasks is completed. Defaults to false
        # @option args [String] :task_id ID of the task.
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
