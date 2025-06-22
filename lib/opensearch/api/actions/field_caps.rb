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
        # Returns the information about the capabilities of fields among multiple indexes.
        #
        # @option args [Boolean] :allow_no_indices If `false`, the request returns an error if any wildcard expression, index alias, or `_all` value targets only missing or closed indexes. This behavior applies even if the request targets other open indexes. For example, a request targeting `foo*,bar*` returns an error if an index starts with foo but no index starts with bar.
        # @option args [Enumerable<String>, String] :expand_wildcards Type of index that wildcard patterns can match. If the request can target data streams, this argument determines whether wildcard expressions match hidden data streams. Supports comma-separated values, such as `open,hidden`.
        # @option args [Enumerable<String>, String] :fields A comma-separated list of fields to retrieve capabilities for. Wildcard (`*`) expressions are supported.
        # @option args [Boolean] :ignore_unavailable If `true`, missing or closed indexes are not included in the response.
        # @option args [Boolean] :include_unmapped If `true`, unmapped fields are included in the response.
        # @option args [Enumerable<String>, String] :index A comma-separated list of data streams, indexes, and aliases used to limit the request. Supports wildcards (*). To target all data streams and indexes, omit this parameter or use * or `_all`.
        # @option args [Hash] :body An index filter specified with the Query DSL
        def field_caps(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = body ? 'POST' : 'GET'
          url     = Utils.build_url(_index, '_field_caps')

          Utils.validate_query_params! args, FIELD_CAPS_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        FIELD_CAPS_QUERY_PARAMS = Set.new(%w[
          allow_no_indices
          expand_wildcards
          fields
          ignore_unavailable
          include_unmapped
        ]).freeze
      end
    end
  end
end
