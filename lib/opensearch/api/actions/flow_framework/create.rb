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
        # Create a workflow.
        #
        # @option args [Boolean] :provision Provision the workflow as part of the request.
        # @option args [Boolean] :reprovision
        # @option args [Boolean] :update_fields Update only the fields included in the request body.
        # @option args [String] :use_case To use a workflow template, specify it in the `use_case` query parameter when creating a workflow.
        # @option args [String] :validation (default: all) Validate the workflow. Valid values are all (validate the template) and none (do not validate the template). Default is all.
        # @option args [Hash] :body
        def create(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = '_plugins/_flow_framework/workflow'

          Utils.validate_query_params! args, CREATE_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        CREATE_QUERY_PARAMS = Set.new(%w[
          provision
          reprovision
          update_fields
          use_case
          validation
        ]).freeze
      end
    end
  end
end
