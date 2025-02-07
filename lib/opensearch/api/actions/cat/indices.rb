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
    module Cat
      module Actions
        # Lists information related to indexes, that is, how much disk space they are using, how many shards they have, their health status, and so on.
        #
        # @option args [String] :bytes The units used to display byte values.
        # @option args [String] :cluster_manager_timeout The amount of time allowed to establish a connection to the cluster manager node.
        # @option args [Enumerable<String>, String] :expand_wildcards Specifies the type of index that wildcard expressions can match. Supports comma-separated values.
        # @option args [String] :format A short version of the `Accept` header, such as `json` or `yaml`.
        # @option args [Enumerable<String>] :h A comma-separated list of column names to display.
        # @option args [String] :health Limits indexes based on their health status. Supported values are `green`, `yellow`, and `red`.
        # @option args [Boolean] :help Returns help information.
        # @option args [Boolean] :include_unloaded_segments Whether to include information from segments not loaded into memory.
        # @option args [Boolean] :local Returns local information but does not retrieve the state from the cluster manager node.
        # @option args [String] :master_timeout DEPRECATED The amount of time allowed to establish a connection to the cluster manager node.
        # @option args [Boolean] :pri When `true`, returns information only from the primary shards.
        # @option args [Enumerable<String>] :s A comma-separated list of column names or column aliases to sort by.
        # @option args [String] :time Specifies the time units.
        # @option args [Boolean] :v Enables verbose mode, which displays column headers.
        # @option args [Enumerable<String>, String] :index A comma-separated list of data streams, indexes, and aliases used to limit the request. Supports wildcards (`*`). To target all data streams and indexes, omit this parameter or use `*` or `_all`.
        def indices(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_cat/indices', _index)

          Utils.validate_query_params! args, INDICES_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        INDICES_QUERY_PARAMS = Set.new(%w[
          bytes
          cluster_manager_timeout
          expand_wildcards
          format
          h
          health
          help
          include_unloaded_segments
          local
          master_timeout
          pri
          s
          time
          v
        ]).freeze
      end
    end
  end
end
