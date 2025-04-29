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
    module FlowFramework
      module Actions
        # Retrieves available workflow steps.
        #
        # @option args [String] :workflow_step The name of the workflow step.
        def get_steps(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = '_plugins/_flow_framework/workflow/_steps'

          Utils.validate_query_params! args, GET_STEPS_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        GET_STEPS_QUERY_PARAMS = Set.new(%w[
          workflow_step
        ]).freeze
      end
    end
  end
end
