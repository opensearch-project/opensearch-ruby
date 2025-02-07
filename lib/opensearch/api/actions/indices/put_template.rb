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
        # Creates or updates an index template.
        #
        # @option args [String] :name *Required* The name of the template
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [Boolean] :create If `true`, this request cannot replace or update existing index templates.
        # @option args [String] :master_timeout DEPRECATED Period to wait for a connection to the cluster-manager node. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [Integer] :order Order in which OpenSearch applies this template if index matches multiple templates.  Templates with lower 'order' values are merged first. Templates with higher 'order' values are merged later, overriding templates with lower values.
        # @option args [Hash] :body *Required* The template definition
        def put_template(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'name' missing" if args['name'].nil?
          raise ArgumentError, "Required argument 'body' missing" if args['body'].nil?

          _name = args.delete('name')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = Utils.build_url('_template', _name)

          Utils.validate_query_params! args, PUT_TEMPLATE_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        PUT_TEMPLATE_QUERY_PARAMS = Set.new(%w[
          cluster_manager_timeout
          create
          master_timeout
          order
        ]).freeze
      end
    end
  end
end
