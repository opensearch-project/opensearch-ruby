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
        # Returns data streams.
        #
        # @option args [Enumerable<String>, String] :name A comma-separated list of data stream names used to limit the request. Wildcard (`*`) expressions are supported. If omitted, all data streams are returned.
        def get_data_stream(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          _name = args.delete('name')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_data_stream', _name)

          Utils.validate_query_params! args
          transport.perform_request(method, url, args, body, headers).body
        end
      end
    end
  end
end
