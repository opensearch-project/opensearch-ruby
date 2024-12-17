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
    module Ml
      module Actions
        # Retrieves a model group.
        #
        # @option args [String] :model_group_id *Required*
        def get_model_group(args = {})
          args = Utils.normalize_arguments(args)
          raise ArgumentError, "Required argument 'model_group_id' missing" unless args['model_group_id']

          _model_group_id = args.delete('model_group_id')

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = ['_plugins/_ml/model_groups', _model_group_id].filter(&:present?).join('/').squeeze('/')

          Utils.validate_query_params args
          transport.perform_request(method, url, args, body, headers).body
        end
      end
    end
  end
end
