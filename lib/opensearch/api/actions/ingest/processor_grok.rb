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
    module Ingest
      module Actions
        # Returns a list of the built-in patterns.
        #
        # @option args [Boolean] :s Sort returned patterns by key name.
        def processor_grok(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = '_ingest/processor/grok'

          Utils.validate_query_params! args, PROCESSOR_GROK_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        PROCESSOR_GROK_QUERY_PARAMS = Set.new(%w[
          s
        ]).freeze
      end
    end
  end
end
