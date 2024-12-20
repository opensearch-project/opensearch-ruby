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
        # Simulate matching the given index name against the index templates in the system.
        #
        # @option args [String] :name *Required* Index or template name to simulate
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [String] :master_timeout DEPRECATED Period to wait for a connection to the cluster-manager node. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [Hash] :body New index template definition, which will be included in the simulation, as if it already exists in the system
        def simulate_index_template(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'name' missing" if args['name'].nil?

          _name = args.delete('name')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = Utils.build_url('_index_template/_simulate_index', _name)

          Utils.validate_query_params! args, SIMULATE_INDEX_TEMPLATE_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        SIMULATE_INDEX_TEMPLATE_QUERY_PARAMS = Set.new(%w[
          cluster_manager_timeout
          master_timeout
        ]).freeze
      end
    end
  end
end
