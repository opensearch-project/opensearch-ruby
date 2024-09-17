# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

# frozen_string_literal: true

require 'mustache'
require 'active_support/all'

# Base Mustache Renderer
class BaseGenerator < Mustache
  self.template_path = './lib/templates'

  def initialize(output_file)
    @output_file = output_file
    super
  end

  def license_header
    Pathname('./lib/_license_header.txt').read
  end

  def generated_code_warning
    Pathname('./lib/_generated_code_warning.txt').read
  end

  def generate
    @output_file.write(render)
  end
end
