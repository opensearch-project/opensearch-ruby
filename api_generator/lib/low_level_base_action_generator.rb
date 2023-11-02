# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

# frozen_string_literal: true

require_relative 'base_generator'

# Generate low-level API actions via Mustache
class LowLevelBaseActionGenerator < BaseGenerator
  self.template_file = './templates/low_level_base_action.mustache'

  def initialize(output_folder, namespace)
    super(output_folder)
    @namespace = namespace
    @action = 'request'
  end

  def namespace_module
    @namespace.camelize
  end

  private

  def output_file
    create_folder(*[@output_folder, @namespace].compact).join("#{@action}.rb")
  end
end
