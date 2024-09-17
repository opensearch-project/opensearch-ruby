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
    module Cluster
      module Actions
        # Fetches weighted shard routing weights.
        #
        # @option args [String] :attribute *Required* Awareness attribute name.
        def get_weighted_routing(args = {})
          args = Utils.normalize_arguments(args)
          raise ArgumentError, "Required argument 'attribute' missing" unless args['attribute']

          _attribute = args.delete('attribute')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = ['_cluster/routing/awareness', _attribute, 'weights'].filter(&:present?).join('/').squeeze('/')

          Utils.validate_query_params args
          transport.perform_request(method, url, args, body, headers).body
        end
      end
    end
  end
end
