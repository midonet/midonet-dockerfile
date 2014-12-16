#!/bin/bash

# Build all the images
docker build -t midonet/zookeeper:3.4.5 dockerfiles/misc/zookeeper
docker build -t midonet/zookeeper dockerfiles/misc/zookeeper

docker build -t midonet/cassandra:2.1.2 dockerfiles/misc/cassandra
docker build -t midonet/cassandra dockerfiles/misc/cassandra

docker build -t midonet/midolman:2014.11-rc3_centos dockerfiles/centos/midolman
docker build -t midonet/midolman:2014.11-rc3_ubuntu dockerfiles/ubuntu/midolman
docker build -t midonet/midolman dockerfiles/ubuntu/midolman

docker build -t midonet/midonet-api:2014.11-rc3_centos dockerfiles/centos/midonet-api
docker build -t midonet/midonet-api:2014.11-rc3_ubuntu dockerfiles/ubuntu/midonet-api
docker build -t midonet/midonet-api dockerfiles/ubuntu/midonet-api

docker build -t midonet/midonet-cli:2014.11-rc3_centos dockerfiles/centos/midonet-cli
docker build -t midonet/midonet-cli:2014.11-rc3_ubuntu dockerfiles/ubuntu/midonet-cli
docker build -t midonet/midonet-cli dockerfiles/ubuntu/midonet-cli
