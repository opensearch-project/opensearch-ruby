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
        # Returns information about a task.
        #
        # @option args [String] :task_id *Required* The ID of the task.
        # @option args [String] :timeout (default: 30s) The amount of time to wait for a response.
        # @option args [Boolean] :wait_for_completion Waits for the matching task to complete. When `true`, the request is blocked until the task has completed.
        def get(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'task_id' missing" if args['task_id'].nil?

          _task_id = args.delete('task_id')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_tasks', _task_id)

          Utils.validate_query_params! args, GET_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        GET_QUERY_PARAMS = Set.new(%w[
          timeout
          wait_for_completion
        ]).freeze
      end
    end
  end
end
