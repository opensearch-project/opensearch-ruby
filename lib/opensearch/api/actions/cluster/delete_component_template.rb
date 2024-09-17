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
    module Cluster
      module Actions
        # Deletes a component template.
        #
        # @option args [String] :name *Required* Name of the component template to delete. Wildcard (*) expressions are supported.
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [String] :master_timeout DEPRECATED Period to wait for a connection to the cluster-manager node. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [String] :timeout Period to wait for a response. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [List] :ignore set to [404] to ignore server's NOT FOUND error for this request
        def delete_component_template(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'name' missing" if args['name'].nil?

          _name = args.delete('name')

          ignore  = args.delete('ignore') || []
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'DELETE'
          url     = Utils.build_url('_component_template', _name)

          Utils.validate_query_params! args, DELETE_COMPONENT_TEMPLATE_QUERY_PARAMS
          transport.perform_delete_request method, url, args, body, headers, ignore.include?(404)
        end

        DELETE_COMPONENT_TEMPLATE_QUERY_PARAMS = Set.new(%w[
          cluster_manager_timeout
          master_timeout
          timeout
        ]).freeze
      end
    end
  end
end
