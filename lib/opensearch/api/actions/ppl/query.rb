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
    module Ppl
      module Actions
        # Send a PPL query to the PPL plugin.
        #
        # @option args [String] :format A short version of the Accept header (for example, `json`, `yaml`).
        # @option args [Boolean] :sanitize (default: true) Specifies whether to escape special characters in the results.
        # @option args [Hash] :body *Required*
        def query(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'body' missing" if args['body'].nil?

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = '_plugins/_ppl'

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
