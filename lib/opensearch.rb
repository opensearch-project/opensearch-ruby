# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.

# This file is generated from the OpenSearch REST API spec.
# Do not modify it by hand. Instead, modify the generator or the spec.

require 'opensearch/transport'
require 'opensearch/api'
Dir[File.expand_path('opensearch/api/**/*.rb', __dir__)].each { |f| require f }

module OpenSearch
  class Client
    include OpenSearch::API::Root::Actions
    attr_accessor :transport

    def initialize(arguments = {}, &block)
      @transport = OpenSearch::Transport::Client.new(arguments, &block)
    end

    def asynchronous_search
      @asynchronous_search ||= OpenSearch::API::Namespace.new(transport, OpenSearch::API::AsynchronousSearch::Actions)
    end

    def cat
      @cat ||= OpenSearch::API::Namespace.new(transport, OpenSearch::API::Cat::Actions)
    end

    def cluster
      @cluster ||= OpenSearch::API::Namespace.new(transport, OpenSearch::API::Cluster::Actions)
    end

    def dangling_indices
      @dangling_indices ||= OpenSearch::API::Namespace.new(transport, OpenSearch::API::DanglingIndices::Actions)
    end

    def flow_framework
      @flow_framework ||= OpenSearch::API::Namespace.new(transport, OpenSearch::API::FlowFramework::Actions)
    end

    def geospatial
      @geospatial ||= OpenSearch::API::Namespace.new(transport, OpenSearch::API::Geospatial::Actions)
    end

    def indices
      @indices ||= OpenSearch::API::Namespace.new(transport, OpenSearch::API::Indices::Actions)
    end

    def ingest
      @ingest ||= OpenSearch::API::Namespace.new(transport, OpenSearch::API::Ingest::Actions)
    end

    def insights
      @insights ||= OpenSearch::API::Namespace.new(transport, OpenSearch::API::Insights::Actions)
    end

    def ism
      @ism ||= OpenSearch::API::Namespace.new(transport, OpenSearch::API::Ism::Actions)
    end

    def knn
      @knn ||= OpenSearch::API::Namespace.new(transport, OpenSearch::API::Knn::Actions)
    end

    def list
      @list ||= OpenSearch::API::Namespace.new(transport, OpenSearch::API::List::Actions)
    end

    def ltr
      @ltr ||= OpenSearch::API::Namespace.new(transport, OpenSearch::API::Ltr::Actions)
    end

    def ml
      @ml ||= OpenSearch::API::Namespace.new(transport, OpenSearch::API::Ml::Actions)
    end

    def neural
      @neural ||= OpenSearch::API::Namespace.new(transport, OpenSearch::API::Neural::Actions)
    end

    def nodes
      @nodes ||= OpenSearch::API::Namespace.new(transport, OpenSearch::API::Nodes::Actions)
    end

    def notifications
      @notifications ||= OpenSearch::API::Namespace.new(transport, OpenSearch::API::Notifications::Actions)
    end

    def observability
      @observability ||= OpenSearch::API::Namespace.new(transport, OpenSearch::API::Observability::Actions)
    end

    def ppl
      @ppl ||= OpenSearch::API::Namespace.new(transport, OpenSearch::API::Ppl::Actions)
    end

    def query
      @query ||= OpenSearch::API::Namespace.new(transport, OpenSearch::API::Query::Actions)
    end

    def remote_store
      @remote_store ||= OpenSearch::API::Namespace.new(transport, OpenSearch::API::RemoteStore::Actions)
    end

    def replication
      @replication ||= OpenSearch::API::Namespace.new(transport, OpenSearch::API::Replication::Actions)
    end

    def rollups
      @rollups ||= OpenSearch::API::Namespace.new(transport, OpenSearch::API::Rollups::Actions)
    end

    def search_pipeline
      @search_pipeline ||= OpenSearch::API::Namespace.new(transport, OpenSearch::API::SearchPipeline::Actions)
    end

    def security
      @security ||= OpenSearch::API::Namespace.new(transport, OpenSearch::API::Security::Actions)
    end

    def sm
      @sm ||= OpenSearch::API::Namespace.new(transport, OpenSearch::API::Sm::Actions)
    end

    def snapshot
      @snapshot ||= OpenSearch::API::Namespace.new(transport, OpenSearch::API::Snapshot::Actions)
    end

    def sql
      @sql ||= OpenSearch::API::Namespace.new(transport, OpenSearch::API::Sql::Actions)
    end

    def tasks
      @tasks ||= OpenSearch::API::Namespace.new(transport, OpenSearch::API::Tasks::Actions)
    end

    def transforms
      @transforms ||= OpenSearch::API::Namespace.new(transport, OpenSearch::API::Transforms::Actions)
    end

    def wlm
      @wlm ||= OpenSearch::API::Namespace.new(transport, OpenSearch::API::Wlm::Actions)
    end

    def http
      @http ||= OpenSearch::API::Namespace.new(transport, OpenSearch::API::Http::Actions)
    end
  end
end
