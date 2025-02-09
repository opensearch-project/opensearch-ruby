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
    module Ml
      module Actions
        # Get a profile tasks.
        #
        # @option args [String] :task_id
        # @option args [Hash] :body
        def get_profile_tasks(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _task_id = args.delete('task_id')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_plugins/_ml/profile/tasks', _task_id)

          Utils.validate_query_params! args
          transport.perform_request(method, url, args, body, headers).body
        end
      end
    end
  end
end
