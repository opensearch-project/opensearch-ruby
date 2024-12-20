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
    module Nodes
      module Actions
        # Reloads secure settings.
        #
        # @option args [Enumerable<String>, String] :node_id The names of particular nodes in the cluster to target.
        # @option args [String] :timeout Period to wait for a response. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [Hash] :body An object containing the password for the OpenSearch keystore.
        def reload_secure_settings(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _node_id = args.delete('node_id')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = Utils.build_url('_nodes', _node_id, 'reload_secure_settings')

          Utils.validate_query_params! args, RELOAD_SECURE_SETTINGS_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        RELOAD_SECURE_SETTINGS_QUERY_PARAMS = Set.new(%w[
          timeout
        ]).freeze
      end
    end
  end
end
