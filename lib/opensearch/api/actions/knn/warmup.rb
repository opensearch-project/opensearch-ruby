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
    module Knn
      module Actions
        # Preloads native library files into memory, reducing initial search latency for specified indexes.
        #
        # @option args [Enumerable<String>] :index *Required* A comma-separated list of indexes; use `_all` or empty string to perform the operation on all indexes.
        def warmup(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'index' missing" if args['index'].nil?

          _index = args.delete('index')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = Utils.build_url('_plugins/_knn/warmup', _index)

          Utils.validate_query_params! args
          transport.perform_request(method, url, args, body, headers).body
        end
      end
    end
  end
end
