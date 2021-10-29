# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.
#
# Modifications Copyright OpenSearch Contributors. See
# GitHub history for details.
#
# Licensed to Elasticsearch B.V. under one or more contributor
# license agreements. See the NOTICE file distributed with
# this work for additional information regarding copyright
# ownership. Elasticsearch B.V. licenses this file to you under
# the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

require 'pathname'
require_relative '../../../lib/opensearch/api/version.rb'

module OpenSearch
  module API
    module FilesHelper
      PROJECT_PATH = File.join(File.dirname(__FILE__), '..')
      SRC_PATH   = File.join(PROJECT_PATH, '..', '..', '..', 'tmp/rest-api-spec/api/')
      OSS_OUTPUT_DIR = '../../opensearch-api/lib/opensearch/api/actions'

      TESTS_DIRECTORIES = {
        oss: "#{PROJECT_PATH}/../../../tmp/rest-api-spec/test/free",
        xpack: "#{PROJECT_PATH}/../../../tmp/rest-api-spec/test/platinum"
      }.freeze

      # Only get JSON files and remove hidden files
      def self.files(api)
        json_files = if api == :xpack
                       xpack_files
                     else
                       Dir.entries(SRC_PATH) - xpack_files
                     end
        json_files.reject do |file|
          File.extname(file) != '.json' ||
            File.basename(file) == '_common.json'
        end.map { |file| "#{SRC_PATH}#{file}" }
      end

      # Path to directory to copy generated files
      def self.output_dir(api)
        Pathname(OSS_OUTPUT_DIR)
      end

      def self.gem_version
        regex = /([0-9]{1,2}\.[0-9x]{1,2})/
        OpenSearch::API::VERSION.match(regex)[0]
      end
    end
  end
end
