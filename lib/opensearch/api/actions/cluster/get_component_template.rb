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
        # Returns one or more component templates.
        #
        # @option args [String] :cluster_manager_timeout (default: 30s) The amount of time to wait for a response from the cluster manager node. For more information about supported time units, see [Common parameters](https://opensearch.org/docs/latest/api-reference/common-parameters/#time-units).
        # @option args [Boolean] :flat_settings Whether to return settings in the flat form, which can improve readability, especially for heavily nested settings. For example, the flat form of `"cluster": { "max_shards_per_node": 500 }` is `"cluster.max_shards_per_node": "500"`.
        # @option args [Boolean] :local When `true`, the request retrieves information from the local node only. When `false`, information is retrieved from the cluster manager node.
        # @option args [String] :master_timeout DEPRECATED A duration. Units can be `nanos`, `micros`, `ms` (milliseconds), `s` (seconds), `m` (minutes), `h` (hours) and `d` (days). Also accepts "0" without a unit and "-1" to indicate an unspecified value.
        # @option args [String] :name The name of the component template to retrieve. Wildcard (`*`) expressions are supported.
        def get_component_template(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _name = args.delete('name')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_component_template', _name)

          Utils.validate_query_params! args, GET_COMPONENT_TEMPLATE_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        GET_COMPONENT_TEMPLATE_QUERY_PARAMS = Set.new(%w[
          cluster_manager_timeout
          flat_settings
          local
          master_timeout
        ]).freeze
      end
    end
  end
end
