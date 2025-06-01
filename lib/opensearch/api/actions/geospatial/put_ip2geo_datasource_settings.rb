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
    module Geospatial
      module Actions
        # Update a specific IP2Geo data source.
        #
        # @option args [String] :name *Required*
        # @option args [Hash] :body *Required*
        def put_ip2geo_datasource_settings(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'name' missing" if args['name'].nil?
          raise ArgumentError, "Required argument 'body' missing" if args['body'].nil?

          _name = args.delete('name')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'PUT'
          url     = Utils.build_url('_plugins/geospatial/ip2geo/datasource', _name, '_settings')

          Utils.validate_query_params! args
          transport.perform_request(method, url, args, body, headers).body
        end
      end
    end
  end
end
