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
        # Deletes a data stream.
        #
        # @option args [Enumerable<String>, String] :name *Required* Comma-separated list of data streams to delete. Wildcard (`*`) expressions are supported.
        # @option args [List] :ignore set to [404] to ignore server's NOT FOUND error for this request
        def delete_data_stream(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'name' missing" if args['name'].nil?

          _name = args.delete('name')

          ignore  = args.delete('ignore') || []
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'DELETE'
          url     = Utils.build_url('_data_stream', _name)

          Utils.validate_query_params! args
          transport.perform_delete_request method, url, args, body, headers, ignore.include?(404)
        end
      end
    end
  end
end
