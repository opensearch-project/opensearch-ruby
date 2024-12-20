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
        # Returns information about whether a particular index exists.
        #
        # @option args [Enumerable<String>, String] :index *Required* Comma-separated list of data streams, indexes, and aliases. Supports wildcards (`*`).
        # @option args [Boolean] :allow_no_indices If `false`, the request returns an error if any wildcard expression, index alias, or `_all` value targets only missing or closed indexes. This behavior applies even if the request targets other open indexes.
        # @option args [String] :cluster_manager_timeout Operation timeout for connection to cluster-manager node.
        # @option args [Enumerable<String>, String] :expand_wildcards Type of index that wildcard patterns can match. If the request can target data streams, this argument determines whether wildcard expressions match hidden data streams. Supports comma-separated values, such as `open,hidden`. Valid values are: `all`, `open`, `closed`, `hidden`, `none`.
        # @option args [Boolean] :flat_settings If `true`, returns settings in flat format.
        # @option args [Boolean] :ignore_unavailable If `false`, the request returns an error if it targets a missing or closed index.
        # @option args [Boolean] :include_defaults If `true`, return all default settings in the response.
        # @option args [Boolean] :local If `true`, the request retrieves information from the local node only.
        def exists(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'index' missing" if args['index'].nil?

          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'HEAD'
          url     = _index

          Utils.validate_query_params! args, EXISTS_QUERY_PARAMS
          transport.perform_head_request method, url, args, body, headers
        end

        EXISTS_QUERY_PARAMS = Set.new(%w[
          allow_no_indices
          cluster_manager_timeout
          expand_wildcards
          flat_settings
          ignore_unavailable
          include_defaults
          local
        ]).freeze
      end
    end
  end
end
