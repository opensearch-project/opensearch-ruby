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
        # Shows information about currently configured aliases to indexes including filter and routing info.
        #
        # @option args [Enumerable<String>, String] :expand_wildcards Whether to expand wildcard expression to concrete indexes that are open, closed or both.
        # @option args [String] :format A short version of the Accept header (for example, `json`, `yaml`).
        # @option args [Enumerable<String>] :h Comma-separated list of column names to display.
        # @option args [Boolean] :help Return help information.
        # @option args [Boolean] :local Return local information, do not retrieve the state from cluster-manager node.
        # @option args [Enumerable<String>] :s Comma-separated list of column names or column aliases to sort by.
        # @option args [Boolean] :v Verbose mode. Display column headers.
        # @option args [Enumerable<String>, String] :name A comma-separated list of aliases to retrieve. Supports wildcards (`*`).  To retrieve all aliases, omit this parameter or use `*` or `_all`.
        def aliases(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _name = args.delete('name')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_cat/aliases', _name)

          Utils.validate_query_params! args, ALIASES_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        ALIASES_QUERY_PARAMS = Set.new(%w[
          expand_wildcards
          format
          h
          help
          local
          s
          v
        ]).freeze
      end
    end
  end
end
