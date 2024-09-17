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
        # @option args [String] :task_id *Required* ID of the task.
        # @option args [String] :timeout Period to wait for a response. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [Boolean] :wait_for_completion If `true`, the request blocks until the task has completed.
        def get(args = {})
          args = Utils.normalize_arguments(args)
          raise ArgumentError, "Required argument 'task_id' missing" unless args['task_id']

          _task_id = args.delete('task_id')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = ['_tasks', _task_id].filter(&:present?).join('/').squeeze('/')

          Utils.validate_query_params args, GET_QUERY_PARAMS
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
