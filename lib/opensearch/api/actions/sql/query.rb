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
    module Sql
      module Actions
        # Executes SQL or PPL queries against OpenSearch indices.
        #
        # @option args [String] :format Specifies the response format (JSON or YAML).
        # @option args [Boolean] :sanitize (default: true) Whether to escape special characters in the results.
        # @option args [Hash] :body Contains the SQL or PPL query to execute.
        def query(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = '_plugins/_sql'

          Utils.validate_query_params! args, QUERY_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        QUERY_QUERY_PARAMS = Set.new(%w[
          format
          sanitize
        ]).freeze
      end
    end
  end
end
