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
    module AsynchronousSearch
      module Actions
        # Get partial responses from asynchronous search.
        #
        # @option args [String] :id *Required*
        def get(args = {})
          args = Utils.normalize_arguments(args)
          raise ArgumentError, "Required argument 'id' missing" unless args['id']

          _id = args.delete('id')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = ['_plugins/_asynchronous_search', _id].filter(&:present?).join('/').squeeze('/')

          Utils.validate_query_params args
          transport.perform_request(method, url, args, body, headers).body
        end
      end
    end
  end
end
