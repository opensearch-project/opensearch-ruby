# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

# frozen_string_literal: true

require_relative 'low_level_base_action_generator'

# Generate low-level API actions via Mustache
class LowLevelActionGenerator < LowLevelBaseActionGenerator
  self.template_file = './templates/low_level_action.mustache'

  def initialize(output_folder, namespace, action)
    super(output_folder, namespace)
    @action = action
  end

  def lower_cased
    @action.downcase
  end

  def upper_cased
    @action.upcase
  end
end
