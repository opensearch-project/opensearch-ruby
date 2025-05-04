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
    module Indices
      module Actions
        # Simulate resolving the given template name or body.
        #
        # @option args [String] :cause (default: false) User defined reason for dry-run creating the new template for simulation purposes.
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [Boolean] :create If `true`, the template passed in the body is only used if no existing templates match the same index patterns. If `false`, the simulation uses the template with the highest priority. Note that the template is not permanently added or updated in either case; it is only used for the simulation.
        # @option args [String] :master_timeout DEPRECATED Period to wait for a connection to the cluster-manager node. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [String] :name Name of the index template to simulate. To test a template configuration before you add it to the cluster, omit this parameter and specify the template configuration in the request body.
        # @option args [Hash] :body The configuration for an index template.
        def simulate_template(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _name = args.delete('name')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = Utils.build_url('_index_template/_simulate', _name)

          Utils.validate_query_params! args, SIMULATE_TEMPLATE_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        SIMULATE_TEMPLATE_QUERY_PARAMS = Set.new(%w[
          cause
          cluster_manager_timeout
          create
          master_timeout
        ]).freeze
      end
    end
  end
end
