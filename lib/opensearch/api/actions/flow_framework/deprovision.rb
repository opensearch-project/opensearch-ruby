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
        # Deprovision workflow's resources when you no longer need them.
        #
        # @option args [String] :workflow_id *Required* The ID of the workflow.
        # @option args [String] :allow_delete Specifies whether to allow deletion of resources with potential data loss.
        def deprovision(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'workflow_id' missing" if args['workflow_id'].nil?

          _workflow_id = args.delete('workflow_id')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = Utils.build_url('_plugins/_flow_framework/workflow', _workflow_id, '_deprovision')

          Utils.validate_query_params! args, DEPROVISION_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        DEPROVISION_QUERY_PARAMS = Set.new(%w[
          allow_delete
        ]).freeze
      end
    end
  end
end
