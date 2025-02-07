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
        # Decommissions a cluster zone based on awareness. This can greatly benefit multi-zone deployments, where awareness attributes can aid in applying new upgrades to a cluster in a controlled fashion.
        #
        # @option args [String] :awareness_attribute_name *Required* The name of the awareness attribute.
        # @option args [String] :awareness_attribute_value *Required* The value of the awareness attribute.
        def put_decommission_awareness(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'awareness_attribute_name' missing" if args['awareness_attribute_name'].nil?
          raise ArgumentError, "Required argument 'awareness_attribute_value' missing" if args['awareness_attribute_value'].nil?

          _awareness_attribute_name = args.delete('awareness_attribute_name')
          _awareness_attribute_value = args.delete('awareness_attribute_value')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'PUT'
          url     = Utils.build_url('_cluster/decommission/awareness', _awareness_attribute_name, _awareness_attribute_value)

          Utils.validate_query_params! args
          transport.perform_request(method, url, args, body, headers).body
        end
      end
    end
  end
end
