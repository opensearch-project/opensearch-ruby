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
        # Returns information about whether a particular alias exists.
        #
        # @option args [Enumerable<String>, String] :name *Required* A comma-separated list of aliases to check. Supports wildcards (`*`).
        # @option args [Boolean] :allow_no_indices If `false`, the request returns an error if any wildcard expression, index alias, or `_all` value targets only missing or closed indexes. This behavior applies even if the request targets other open indexes.
        # @option args [Enumerable<String>, String] :expand_wildcards Type of index that wildcard patterns can match. If the request can target data streams, this argument determines whether wildcard expressions match hidden data streams. Supports comma-separated values, such as `open,hidden`. Valid values are: `all`, `open`, `closed`, `hidden`, `none`.
        # @option args [Boolean] :ignore_unavailable If `false`, requests that include a missing data stream or index in the target indexes or data streams return an error.
        # @option args [Boolean] :local If `true`, the request retrieves information from the local node only.
        # @option args [Enumerable<String>, String] :index A comma-separated list of data streams or indexes used to limit the request. Supports wildcards (`*`). To target all data streams and indexes, omit this parameter or use `*` or `_all`.
        def exists_alias(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'name' missing" if args['name'].nil?

          _name = args.delete('name')
          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'HEAD'
          url     = Utils.build_url(_index, '_alias', _name)

          Utils.validate_query_params! args, EXISTS_ALIAS_QUERY_PARAMS
          transport.perform_head_request method, url, args, body, headers
        end

        EXISTS_ALIAS_QUERY_PARAMS = Set.new(%w[
          allow_no_indices
          expand_wildcards
          ignore_unavailable
          local
        ]).freeze
      end
    end
  end
end
