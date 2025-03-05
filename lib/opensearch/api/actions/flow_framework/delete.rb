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
        # Delete a workflow.
        #
        # @option args [String] :workflow_id *Required*
        # @option args [Boolean] :clear_status Delete the workflow state (without deprovisioning resources) after deleting the template. OpenSearch deletes the workflow state only if the provisioning status is not IN_PROGRESS. Default is false.
        def delete(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'workflow_id' missing" if args['workflow_id'].nil?

          _workflow_id = args.delete('workflow_id')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'DELETE'
          url     = Utils.build_url('_plugins/_flow_framework/workflow', _workflow_id)

          Utils.validate_query_params! args, DELETE_QUERY_PARAMS
          transport.perform_delete_request method, url, args, body, headers
        end

        DELETE_QUERY_PARAMS = Set.new(%w[
          clear_status
        ]).freeze
      end
    end
  end
end
