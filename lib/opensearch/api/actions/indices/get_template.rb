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
        # Returns an index template.
        #
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [Boolean] :flat_settings If `true`, returns settings in flat format.
        # @option args [Boolean] :local If `true`, the request retrieves information from the local node only.
        # @option args [String] :master_timeout DEPRECATED Period to wait for a connection to the cluster-manager node. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [Enumerable<String>, String] :name A comma-separated list of index template names used to limit the request. Wildcard (`*`) expressions are supported. To return all index templates, omit this parameter or use a value of `_all` or `*`.
        def get_template(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _name = args.delete('name')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_template', _name)

          Utils.validate_query_params! args, GET_TEMPLATE_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        GET_TEMPLATE_QUERY_PARAMS = Set.new(%w[
          cluster_manager_timeout
          flat_settings
          local
          master_timeout
        ]).freeze
      end
    end
  end
end
