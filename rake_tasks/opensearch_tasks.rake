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

OPENSEARCH_PATH = "#{CURRENT_PATH}/tmp/opensearch".freeze

desc 'Clone opensearch into the ./tmp directory'
task :setup do
  unless File.exist?('./tmp/opensearch')
    sh 'git clone https://github.com/opensearch/opensearch.git tmp/opensearch'
  end
end

namespace :opensearch do
  desc 'Wait for opensearch cluster to be in green state'
  task :wait_for_green do
    require 'opensearch'

    ready = nil
    5.times do |i|
      begin
        puts "Attempting to wait for green status: #{i + 1}"
        if admin_client.cluster.health(wait_for_status: 'green', timeout: '50s')
          ready = true
          break
        end
      rescue OpenSearch::Transport::Transport::Errors::RequestTimeout => e
        puts "Couldn't confirm green status.\n#{e.inspect}."
      rescue Faraday::ConnectionFailed => e
        puts "Couldn't connect to OpenSearch.\n#{e.inspect}."
        sleep(30)
      end
    end
    unless ready
      puts "Couldn't connect to OpenSearch, aborting program."
      exit(1)
    end
  end

  desc 'Download artifacts (tests and REST spec) for currently running cluster'
  task :download_artifacts do
    json_filename = CURRENT_PATH.join('tmp/artifacts.json')

    # Get version number and build hash of running cluster:
    es_info = cluster_info
    version_number = cluster_info['number']
    build_hash = cluster_info['build_hash']

    puts "Build hash: #{build_hash}"
    # Create ./tmp if it doesn't exist
    Dir.mkdir(CURRENT_PATH.join('tmp'), 0700) unless File.directory?(CURRENT_PATH.join('tmp'))

    # Download json file with package information for version:
    json_url = "https://artifacts-api.elastic.co/v1/versions/#{version_number}"
    download_file!(json_url, json_filename)

    # Get the package url from the json file given the build hash
    zip_url = package_url(json_filename, build_hash)

    # Download the zip file
    filename = CURRENT_PATH.join("tmp/#{zip_url.split('/').last}")
    download_file!(zip_url, filename)

    puts "Unzipping file #{filename}"
    `unzip -o #{filename} -d tmp/`
    `rm #{filename}`
    puts 'Artifacts downloaded in ./tmp'
  end

  desc <<-DESC
    Build OpenSearch for the specified branch ('origin/main' by default)

    Build a specific branch:

        $ rake opensearch:build[origin/1.x]

    The task will execute `git fetch` to synchronize remote branches.
  DESC
  task :build, :branch do |task, args|
    Rake::Task['opensearch:status'].invoke
    puts '-' * 80

    gitref = args[:branch] || 'origin/main'
    es_version = gitref.gsub(/^v|origin\/(\d\.+)/, '\1').to_f

    current_branch = `git --git-dir=#{CURRENT_PATH.join('tmp/opensearch/.git')} --work-tree=#{CURRENT_PATH.join('tmp/opensearch')} branch --no-color`.split("\n").select { |b| b =~ /^\*/ }.first.gsub(/^\*\s*/, '')

    STDOUT.puts "Building version [#{es_version}] from [#{gitref}]:", ""

    case es_version
    when 0.0, 7.0, 8.0
      path_to_build = CURRENT_PATH.join('tmp/opensearch/distribution/docker/build/docker/opensearch-*.tar.gz')
      build_command = "cd #{CURRENT_PATH.join('tmp/opensearch')} && ./gradlew assemble;"

      extract_command = <<-CODE.gsub(/          /, '')
          build=`ls #{path_to_build} | awk '{print $NF}' | awk -F '/' '{print $NF}' | sed s/\.tar\.gz//`
          if [ $build ]; then
            rm -rf "#{CURRENT_PATH.join('tmp/builds')}/$build";
            echo "cool"
          else
            echo "Cannot determine build, exiting..."
            exit 1
          fi
          tar xvf #{path_to_build} -C #{CURRENT_PATH.join('tmp/builds')};
      CODE
    when 5..1000
      path_to_build = CURRENT_PATH.join('tmp/opensearch/distribution/tar/build/distributions/opensearch-*.tar.gz')
      build_command = "cd #{CURRENT_PATH.join('tmp/opensearch/distribution/tar')} && gradle clean assemble;"
      extract_command = <<-CODE.gsub(/          /, '')
          build=`ls #{path_to_build} | xargs -0 basename | sed s/\.tar\.gz//`
          if [[ $build ]]; then
            rm -rf "#{CURRENT_PATH.join('tmp/builds')}/$build";
          else
            echo "Cannot determine build, exiting..."
            exit 1
          fi
          tar xvf #{path_to_build} -C #{CURRENT_PATH.join('tmp/builds')};
      CODE
    when 1.8..4
      path_to_build   = CURRENT_PATH.join('tmp/opensearch/distribution/tar/target/releases/opensearch-*.tar.gz')
      build_command = "cd #{CURRENT_PATH.join('tmp/opensearch')} && MAVEN_OPTS=-Xmx1g mvn --projects core,distribution/tar clean package -DskipTests -Dskip.integ.tests;"
      extract_command = <<-CODE.gsub(/          /, '')
          build=`ls #{path_to_build} | xargs -0 basename | sed s/\.tar\.gz//`
          if [[ $build ]]; then
            rm -rf "#{CURRENT_PATH.join('tmp/builds')}/$build";
          else
            echo "Cannot determine build, exiting..."
            exit 1
          fi
          tar xvf #{path_to_build} -C #{CURRENT_PATH.join('tmp/builds')};
      CODE
    when 0.1..1.7
      path_to_build   = CURRENT_PATH.join('tmp/opensearch/target/releases/opensearch-*.tar.gz')
      build_command = "cd #{CURRENT_PATH.join('tmp/opensearch')} && MAVEN_OPTS=-Xmx1g mvn clean package -DskipTests"
      extract_command = <<-CODE.gsub(/          /, '')
          build=`ls #{path_to_build} | xargs -0 basename | sed s/\.tar\.gz//`
          if [ $build ]; then
            rm -rf "#{CURRENT_PATH.join('tmp/builds')}/$build";
          else
            echo "Cannot determine build, exiting..."
            exit 1
          fi
          tar xvf #{path_to_build} -C #{CURRENT_PATH.join('tmp/builds')};
      CODE
    else
      STDERR.puts "", "[!] Cannot determine a compatible version of the build (gitref: #{gitref}, es_version: #{es_version})"
      exit(1)
    end

    sh <<-CODE.gsub(/      /, '')
      mkdir -p #{CURRENT_PATH.join('tmp/builds')};
      rm -rf '#{CURRENT_PATH.join('tmp/opensearch/distribution/tar/target/')}';
      cd #{CURRENT_PATH.join('tmp/opensearch')} && git fetch origin --quiet;
      cd #{CURRENT_PATH.join('tmp/opensearch')} && git checkout #{gitref};
      #{build_command}
      #{extract_command}
      echo; echo; echo "Built: $build"
    CODE

    puts '', '-' * 80, ''
    Rake::Task['opensearch:builds'].invoke
  end

  desc "Display the info for all branches in the OpenSearch submodule"
  task :status do
    sh "git --git-dir=#{CURRENT_PATH.join('tmp/opensearch/.git')} --work-tree=#{CURRENT_PATH.join('tmp/opensearch')} branch -v -v", :verbose => false
  end

  desc "Display the list of builds"
  task :builds do
    system "mkdir -p #{CURRENT_PATH.join('tmp/builds')};"
    puts "Builds:"
    Dir.entries(CURRENT_PATH.join('tmp/builds')).reject { |f| f =~ /^\./ }.each do |build|
      puts "* #{build}"
    end
  end

  desc "Display the history of the 'rest-api-spec' repo"
  task :changes do
    STDERR.puts "Log: #{CURRENT_PATH.join('tmp/opensearch')}/rest-api-spec", ""
    sh "git --git-dir=#{CURRENT_PATH.join('tmp/opensearch/.git')} --work-tree=#{CURRENT_PATH.join('tmp/opensearch')} log --pretty=format:'%C(yellow)%h%Creset %s \e[2m[%ar by %an]\e[0m' -- rest-api-spec", :verbose => false
  end

  desc "Checkout the build hash from the running OpenSearch server"
  task :checkout_build do
    require 'opensearch'

    branches = `git --git-dir=#{OPENSEARCH_PATH}/.git --work-tree=#{OPENSEARCH_PATH} branch --no-color`
    current_branch = branches.
        split("\n").
        select { |b| b =~ /^\*/ }.
        reject { |b| b =~ /no branch|detached/ }.
        map    { |b| b.gsub(/^\*\s*/, '') }.
        first

    unless current_branch
      STDERR.puts "[!] Unable to determine current branch, defaulting to 'main'"
      current_branch = 'main'
    end

    es_version_info = admin_client.info['version']
    unless (build_hash = es_version_info['build_hash'])
      $stderr.puts "[!] Cannot determine checkout build hash -- server not running"
      exit(1)
    end

    $stdout.puts "ELASTICSEARCH INFO: #{es_version_info}"

    name = ENV['CI'] ? build_hash : "[\e[1m#{build_hash}\e[0m]"
    STDERR.puts '-'*80, "YAML tests: Switching to #{name} from #{current_branch}", '-'*80
    git_specs("checkout #{build_hash} --force --quiet")
  end
end

def git_specs(command, options={})
  sh "git --git-dir=#{OPENSEARCH_PATH}/.git --work-tree=#{OPENSEARCH_PATH} #{command}", options
end
