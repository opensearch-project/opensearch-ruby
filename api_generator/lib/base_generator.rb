# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

# frozen_string_literal: true

require 'openapi3_parser'
require 'mustache'
require 'active_support/all'

# Base Mustache Generator
class BaseGenerator < Mustache
  self.template_path = './templates'

  def initialize(output_folder)
    @output_folder = output_folder
    super
  end

  def license_header
    Pathname('./templates/license_header.txt').read
  end

  def generated_code_warning
    "# This code was generated from OpenSearch API Spec.\n" \
      '# Update the code generation logic instead of modifying this file directly.'
  end

  def generate
    output_file.write(render)
  end

  private

  def output_file
    raise "'#{__method__}' Must be implemented by subclass"
  end

  def create_folder(*components)
    folder = components.reduce(&:+)
    folder.mkpath unless folder.exist?
    folder
  end
end
