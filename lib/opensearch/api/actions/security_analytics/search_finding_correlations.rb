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
    module SecurityAnalytics
      module Actions
        # List correlations for a finding.
        #
        # @option args [String] :detector_type *Required* The log type of findings you want to correlate with the specified finding. Required.
        # @option args [String] :finding *Required* The finding ID for which you want to find other findings that are correlated. Required.
        # @option args [Integer] :nearby_findings (default: 10) The number of nearby findings you want to return. Optional.
        # @option args [Integer] :time_window (default: 300000) The time window (in ms) in which all of the correlations must have occurred together. Optional.
        def search_finding_correlations(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          raise ArgumentError, "Required argument 'detector_type' missing" if args['detector_type'].nil?
          raise ArgumentError, "Required argument 'finding' missing" if args['finding'].nil?

          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = '_plugins/_security_analytics/findings/correlate'

          Utils.validate_query_params! args, SEARCH_FINDING_CORRELATIONS_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        SEARCH_FINDING_CORRELATIONS_QUERY_PARAMS = Set.new(%w[
          detector_type
          finding
          nearby_findings
          time_window
        ]).freeze
      end
    end
  end
end
