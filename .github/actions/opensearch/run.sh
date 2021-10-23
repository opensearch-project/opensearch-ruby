#!/bin/bash

set -euxo pipefail

if [[ -z $STACK_VERSION ]]; then
  echo -e "\033[31;1mERROR:\033[0m Required environment variable [STACK_VERSION] not set\033[0m"
  exit 1
fi

MAJOR_VERSION=`echo ${STACK_VERSION} | cut -c 1`

docker network create cluster

for (( node=1; node<=${NODES-1}; node++ ))
do
  port_com=$((9300 + $node - 1))
  UNICAST_HOSTS+="es$node:${port_com},"
done

for (( node=1; node<=${NODES-1}; node++ ))
do
  port=$((PORT + $node - 1))
  port_com=$((9300 + $node - 1))
  docker run \
    --rm \
    --env "node.name=os${node}" \
    --env "cluster.name=docker-opensearch" \
    --env "cluster.initial_master_nodes=os1" \
    --env "discovery.seed_hosts=os1" \
    --env "cluster.routing.allocation.disk.threshold_enabled=false" \
    --env "bootstrap.memory_lock=true" \
    --env "ES_JAVA_OPTS=-Xms1g -Xmx1g" \
    --env "http.port=${port}" \
    --env "action.destructive_requires_name=false" \
    --ulimit nofile=65536:65536 \
    --ulimit memlock=-1:-1 \
    --publish "${port}:${port}" \
    --detach \
    --network=cluster \
    --name="os${node}" \
    opensearchproject/opensearch:${STACK_VERSION}
done

docker run \
  --network cluster \
  --rm \
  appropriate/curl \
  --max-time 120 \
  --retry 120 \
  --retry-delay 1 \
  --retry-connrefused \
  --show-error \
  --silent \
  http://os1:$PORT

sleep 10

echo "OpenSearch up and running"
