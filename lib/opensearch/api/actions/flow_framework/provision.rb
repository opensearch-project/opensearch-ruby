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
        # Provisioning a workflow. This API is also executed when the Create or Update Workflow API is called with the provision parameter set to true.
        #
        # @option args [String] :workflow_id *Required* The ID of the workflow.
        # @option args [Hash] :body Pass dynamic substitution expressions as key-value pairs, either as query parameters or in the request body. For example, if you specified a credential field in the template as `openai_key: '$'`, you can pass `openai_key` as a query parameter or in the request body.
        def provision(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'workflow_id' missing" if args['workflow_id'].nil?

          _workflow_id = args.delete('workflow_id')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = Utils.build_url('_plugins/_flow_framework/workflow', _workflow_id, '_provision')

          Utils.validate_query_params! args
          transport.perform_request(method, url, args, body, headers).body
        end
      end
    end
  end
end
