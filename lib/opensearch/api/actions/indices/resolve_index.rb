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
        # Returns information about any matching indexes, aliases, and data streams.
        #
        # @option args [Enumerable<String>, String] :name *Required* Comma-separated name(s) or index pattern(s) of the indexes, aliases, and data streams to resolve. Resources on remote clusters can be specified using the `<cluster>`:`<name>` syntax.
        # @option args [Enumerable<String>, String] :expand_wildcards Type of index that wildcard patterns can match. If the request can target data streams, this argument determines whether wildcard expressions match hidden data streams. Supports comma-separated values, such as `open,hidden`. Valid values are: `all`, `open`, `closed`, `hidden`, `none`.
        def resolve_index(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'name' missing" if args['name'].nil?

          _name = args.delete('name')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_resolve/index', _name)

          Utils.validate_query_params! args, RESOLVE_INDEX_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        RESOLVE_INDEX_QUERY_PARAMS = Set.new(%w[
          expand_wildcards
        ]).freeze
      end
    end
  end
end
