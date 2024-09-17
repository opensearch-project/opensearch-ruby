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
        # Deletes a model group.
        #
        # @option args [String] :model_group_id *Required*
        # @option args [List] :ignore set to [404] to ignore server's NOT FOUND error for this request
        def delete_model_group(args = {})
          args = Utils.normalize_arguments(args)
          raise ArgumentError, "Required argument 'model_group_id' missing" unless args['model_group_id']

          _model_group_id = args.delete('model_group_id')

          ignore  = args.delete('ignore') || []
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'DELETE'
          url     = ['_plugins/_ml/model_groups', _model_group_id].filter(&:present?).join('/').squeeze('/')

          Utils.validate_query_params args
          transport.perform_delete_request method, url, args, body, headers, ignore.include?(404)
        end
      end
    end
  end
end
