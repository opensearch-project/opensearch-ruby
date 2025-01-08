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
        # Creates or updates a component template.
        #
        # @option args [String] :name *Required* Name of the component template to create. OpenSearch includes the following built-in component templates: `logs-mappings`; 'logs-settings`; `metrics-mappings`; `metrics-settings`;`synthetics-mapping`; `synthetics-settings`. OpenSearch Agent uses these templates to configure backing indexes for its data streams. If you use OpenSearch Agent and want to overwrite one of these templates, set the `version` for your replacement template higher than the current version. If you don't use OpenSearch Agent and want to disable all built-in component and index templates, set `stack.templates.enabled` to `false` using the cluster update settings API.
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [Boolean] :create If `true`, this request cannot replace or update existing component templates.
        # @option args [String] :master_timeout DEPRECATED Period to wait for a connection to the cluster-manager node. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [String] :timeout Operation timeout.
        # @option args [Hash] :body *Required* The template definition
        def put_component_template(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'name' missing" if args['name'].nil?
          raise ArgumentError, "Required argument 'body' missing" if args['body'].nil?

          _name = args.delete('name')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = Utils.build_url('_component_template', _name)

          Utils.validate_query_params! args, PUT_COMPONENT_TEMPLATE_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        PUT_COMPONENT_TEMPLATE_QUERY_PARAMS = Set.new(%w[
          cluster_manager_timeout
          create
          master_timeout
          timeout
        ]).freeze
      end
    end
  end
end
