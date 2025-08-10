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
        # Performs the flush operation on one or more indexes.
        #
        # @option args [Boolean] :allow_no_indices If `false`, the request returns an error if any wildcard expression, index alias, or `_all` value targets only missing or closed indexes. This behavior applies even if the request targets other open indexes.
        # @option args [Enumerable<String>, String] :expand_wildcards Type of index that wildcard patterns can match. If the request can target data streams, this argument determines whether wildcard expressions match hidden data streams. Supports comma-separated values, such as `open,hidden`. Valid values are: `all`, `open`, `closed`, `hidden`, `none`.
        # @option args [Boolean] :force If `true`, the request forces a flush even if there are no changes to commit to the index.
        # @option args [Boolean] :ignore_unavailable If `false`, the request returns an error if it targets a missing or closed index.
        # @option args [Boolean] :wait_if_ongoing (default: true) If `true`, the flush operation blocks until execution when another flush operation is running. If `false`, OpenSearch returns an error if you request a flush when another flush operation is running.
        # @option args [Enumerable<String>, String] :index A comma-separated list of data streams, indexes, and aliases to flush. Supports wildcards (`*`). To flush all data streams and indexes, omit this parameter or use `*` or `_all`.
        def flush(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = body ? 'POST' : 'GET'
          url     = Utils.build_url(_index, '_flush')

          Utils.validate_query_params! args, FLUSH_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        FLUSH_QUERY_PARAMS = Set.new(%w[
          allow_no_indices
          expand_wildcards
          force
          ignore_unavailable
          wait_if_ongoing
        ]).freeze
      end
    end
  end
end
