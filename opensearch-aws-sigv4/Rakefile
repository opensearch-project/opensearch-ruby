# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.
#
# Modifications Copyright OpenSearch Contributors. See
# GitHub history for details.

require 'bundler/gem_tasks'

task(:default) { system 'rake --tasks' }

desc 'Run unit tests'
task test: 'test:spec'

# ----- Test tasks ------------------------------------------------------------
require 'rspec/core/rake_task'

namespace :test do
  RSpec::Core::RakeTask.new(:integration) do |t|
    t.pattern = 'spec/integration/**{,/*/**}/*_spec.rb'
  end

  RSpec::Core::RakeTask.new(:unit) do |t|
    t.pattern = 'spec/unit/**{,/*/**}/*_spec.rb'
  end

  desc 'Run unit and integration tests'
  task :all do
    Rake::Task['test:unit'].invoke
    Rake::Task['test:integration'].invoke
  end
end

# ----- Documentation tasks ---------------------------------------------------

require 'yard'
YARD::Rake::YardocTask.new(:doc) do |t|
  t.options = %w[--embed-mixins --markup=markdown]
end
