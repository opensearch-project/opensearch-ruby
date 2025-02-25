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
    module Security
      module Actions
        # Retrieves the specified node's security certificates.
        #
        # @option args [String] :node_id *Required* The node ID to retrieve certificates for.
        # @option args [String] :cert_type The type of certificates (`HTTP`, `TRANSPORT`, or `ALL`) to retrieve from a node.
        # @option args [String] :timeout The maximum duration, in seconds, to spend retrieving certificates from all nodes before a timeout.
        def get_node_certificates(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'node_id' missing" if args['node_id'].nil?

          _node_id = args.delete('node_id')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_plugins/_security/api/certificates', _node_id)

          Utils.validate_query_params! args, GET_NODE_CERTIFICATES_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        GET_NODE_CERTIFICATES_QUERY_PARAMS = Set.new(%w[
          cert_type
          timeout
        ]).freeze
      end
    end
  end
end
