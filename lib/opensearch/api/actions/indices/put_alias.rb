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
        # Creates or updates an alias.
        #
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [String] :master_timeout DEPRECATED Period to wait for a connection to the cluster-manager node. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [String] :timeout Period to wait for a response. If no response is received before the timeout expires, the request fails and returns an error.
        # @option args [String] :name Alias to update. If the alias doesn't exist, the request creates it. Index alias names support date math.
        # @option args [Enumerable<String>, String] :index Comma-separated list of data streams or indexes to add. Supports wildcards (`*`). Wildcard patterns that match both data streams and indexes return an error.
        # @option args [Hash] :body The settings for the alias, such as `routing` or `filter`
        def put_alias(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _name = args.delete('name')
          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = _name.nil? ? 'POST' : 'PUT'
          url     = Utils.build_url(_index, '_aliases', _name)

          Utils.validate_query_params! args, PUT_ALIAS_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        PUT_ALIAS_QUERY_PARAMS = Set.new(%w[
          cluster_manager_timeout
          master_timeout
          timeout
        ]).freeze
      end
    end
  end
end
