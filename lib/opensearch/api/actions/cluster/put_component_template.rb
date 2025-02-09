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
        # @option args [String] :name *Required* The name of the component template to create. OpenSearch includes the following built-in component templates: `logs-mappings`; 'logs-settings`; `metrics-mappings`; `metrics-settings`;`synthetics-mapping`; `synthetics-settings`. OpenSearch uses these templates to configure backing indexes for its data streams. If you want to overwrite one of these templates, set the replacement template `version` to a higher value than the current version. If you want to disable all built-in component and index templates, set `stack.templates.enabled` to `false` using the Cluster Update Settings API.
        # @option args [String] :cluster_manager_timeout A duration. Units can be `nanos`, `micros`, `ms` (milliseconds), `s` (seconds), `m` (minutes), `h` (hours) and `d` (days). Also accepts "0" without a unit and "-1" to indicate an unspecified value.
        # @option args [Boolean] :create When `true`, this request cannot replace or update existing component templates.
        # @option args [String] :master_timeout DEPRECATED A duration. Units can be `nanos`, `micros`, `ms` (milliseconds), `s` (seconds), `m` (minutes), `h` (hours) and `d` (days). Also accepts "0" without a unit and "-1" to indicate an unspecified value.
        # @option args [String] :timeout A duration. Units can be `nanos`, `micros`, `ms` (milliseconds), `s` (seconds), `m` (minutes), `h` (hours) and `d` (days). Also accepts "0" without a unit and "-1" to indicate an unspecified value.
        # @option args [Hash] :body *Required* The template definition.
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
