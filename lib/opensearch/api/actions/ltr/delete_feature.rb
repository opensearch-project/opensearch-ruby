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
    module Ltr
      module Actions
        # Delete a feature from the default feature store.
        #
        # @option args [String] :id *Required* The name of the feature.
        # @option args [String] :store The name of the feature store.
        def delete_feature(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'id' missing" if args['id'].nil?

          _id = args.delete('id')
          _store = args.delete('store')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'DELETE'
          url     = Utils.build_url('_ltr', _store, '_feature', _id)

          Utils.validate_query_params! args
          transport.perform_delete_request method, url, args, body, headers
        end
      end
    end
  end
end
