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
        # Registers a model group.
        #
        # @option args [Hash] :body
        def register_model_group(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'POST'
          url     = '_plugins/_ml/model_groups/_register'

          Utils.validate_query_params! args
          transport.perform_request(method, url, args, body, headers).body
        end
      end
    end
  end
end
