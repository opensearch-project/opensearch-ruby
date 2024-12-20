# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

# This file is generated from the OpenSearch REST API spec.
# Do not modify it by hand. Instead, modify the generator or the spec

# frozen_string_literal: true

require 'cgi'

module OpenSearch
  module API
    module Utils
      NON_URL_ARGS = Set.new(%w[body headers ignore]).freeze
      BULK_OPERATIONS = Set.new(%w[index create delete update]).freeze

      # @return a new hash with all keys converted to strings and url param values escaped
      # @param [Hash] args
      def self.clone_and_normalize_arguments(args)
        args.each_with_object({}) do |(k, v), acc|
          k = k.to_s
          acc[k] = NON_URL_ARGS.include?(k) ? v : normalize_value(v)
        end
      end

      # @param [Hash] params the query params to validate
      # @param [Set<String>] valid_param_names the list of valid params names for the api method
      def self.validate_query_params!(params, valid_param_names = nil)
        return if OpenSearch::API.settings[:skip_parameter_validation]
        params.each_key do |k|
          next if valid_param_names&.include?(k)
          next if GLOBAL_QUERY_PARAMS.include?(k)
          raise ArgumentError, "URL parameter '#{k}' is not supported"
        end
      end

      # @return the value escaped for URL unless it is a Hash
      def self.normalize_value(value)
        return value.clone if value.is_a? Hash
        value = value.to_s.strip unless value.is_a? Enumerable
        value = value.split(',') if value.is_a? String
        value.map { |v| CGI.escape(v.to_s) }.join(',')
      end

      def self.build_url(*parts)
        parts.compact.join('/').squeeze('/')
      end

      # Convert an array of payloads into OpenSearch `header\ndata` format
      #
      # Supports various different formats of the payload: Array of Strings, Header/Data pairs,
      # or the convenient "combined" format where data is passed along with the header
      # in a single item.
      #
      #     OpenSearch::API::Utils.__bulkify [
      #       { :index =>  { :_index => 'myindexA', :_id => '1', :data => { :title => 'Test' } } },
      #       { :update => { :_index => 'myindexB', :_id => '2', :data => { :doc => { :title => 'Update' } } } }
      #     ]
      #
      #     # => {"index":{"_index":"myindexA","_id":"1"}}
      #     # => {"title":"Test"}
      #     # => {"update":{"_index":"myindexB","_id":"2"}}
      #     # => {"doc":{"title":"Update"}}
      # TODO: refactor this method to be more readable
      def self.bulkify(payload)
        return payload unless payload.is_a?(Array)

        # Hashes with `:data`
        if payload.any? do |d|
             d.is_a?(Hash) && d.values.first.is_a?(Hash) && BULK_OPERATIONS.include?(d.keys.first.to_s) && (d.values.first[:data] || d.values.first['data'])
           end
          payload = payload
                    .each_with_object([]) do |item, sum|
                      operation, meta = item.to_a.first
                      meta            = meta.clone
                      data            = meta.delete(:data) || meta.delete('data')

                      sum << { operation => meta }
                      sum << data if data
                    end
          payload = payload.map { |item| OpenSearch::API.serializer.dump(item) }
          payload << '' unless payload.empty?

        # Array of strings
        elsif payload.all? { |d| d.is_a? String }
          payload << ''

        # Header/Data pairs
        else
          payload = payload.map { |item| OpenSearch::API.serializer.dump(item) }
          payload << ''
        end

        payload.join("\n")
      end
    end
  end
end
