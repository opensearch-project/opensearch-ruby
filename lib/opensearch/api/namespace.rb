# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

# frozen_string_literal: true

module OpenSearch
  module API
    # A child-client housing all the actions for a specific namespace
    class Namespace
      attr_reader :transport

      # @param [OpenSearch::Transport::Client] transport
      # @param [Module] ns_actions the module containing the API actions for this namespace
      def initialize(transport, ns_actions)
        @transport = transport
        send :extend, ns_actions
      end
    end
  end
end
