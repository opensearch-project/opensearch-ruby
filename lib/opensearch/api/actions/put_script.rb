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
    module Root
      module Actions
        # Creates or updates a script.
        #
        # @option args [String] :id *Required* Identifier for the stored script or search template. Must be unique within the cluster.
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [String] :context Context in which the script or search template should run. To prevent errors, the API immediately compiles the script or template in this context.
        # @option args [String] :master_timeout DEPRECATED Period to wait for a connection to the cluster-manager node. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [String] :timeout Period to wait for a response. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [Hash] :body *Required* The document
        def put_script(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'id' missing" if args['id'].nil?
          raise ArgumentError, "Required argument 'body' missing" if args['body'].nil?

          _id = args.delete('id')
          _context = args.delete('context')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = _context.nil? ? 'POST' : 'PUT'
          url     = Utils.build_url('_scripts', _id, _context)

          Utils.validate_query_params! args, PUT_SCRIPT_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        PUT_SCRIPT_QUERY_PARAMS = Set.new(%w[
          cluster_manager_timeout
          master_timeout
          timeout
        ]).freeze
      end
    end
  end
end
