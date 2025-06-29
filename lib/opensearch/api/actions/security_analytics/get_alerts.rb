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
        # Retrieve alerts related to a specific detector type or detector ID.
        #
        # @option args [String] :alertState Used to filter by alert state. Optional.
        # @option args [String] :detectorType The type of detector used to fetch alerts. Optional when `detector_id` is specified. Otherwise required.
        # @option args [String] :detector_id The ID of the detector used to fetch alerts. Optional when `detectorType` is specified. Otherwise required.
        # @option args [Integer] :endTime The end timestamp (in ms) of the time window in which you want to retrieve alerts. Optional.
        # @option args [String] :missing Used to sort by whether the field `missing` exists or not in the documents associated with the alert. Optional.
        # @option args [String] :searchString The alert attribute you want returned in the search. Optional.
        # @option args [String] :severityLevel Used to filter by alert severity level. Optional.
        # @option args [Integer] :size (default: 20) The maximum number of results returned in the response. Optional.
        # @option args [String] :sortOrder (default: asc) The order used to sort the list of findings. Possible values are `asc` or `desc`. Optional.
        # @option args [String] :sortString (default: start_time) The string used by Security Analytics to sort the alerts. Optional.
        # @option args [Integer] :startIndex (default: 0) The pagination index. Optional.
        # @option args [Integer] :startTime The beginning timestamp (in ms) of the time window in which you want to retrieve alerts. Optional.
        def get_alerts(args = {})
          args = Utils.clone_and_normalize_arguments(args)
          headers = args.delete('headers') || {}
          body    = args.delete('body')
          method  = 'GET'
          url     = '_plugins/_security_analytics/alerts'

          Utils.validate_query_params! args, GET_ALERTS_QUERY_PARAMS
          transport.perform_request(method, url, args, body, headers).body
        end

        GET_ALERTS_QUERY_PARAMS = Set.new(%w[
          alertState
          detectorType
          detector_id
          endTime
          missing
          searchString
          severityLevel
          size
          sortOrder
          sortString
          startIndex
          startTime
        ]).freeze
      end
    end
  end
end
