#!/bin/bash

sed -i '/^servers/c\servers = '$CS_PORT_9042_TCP_ADDR:$CS_PORT_9042_TCP_PORT'' /etc/midolman/midolman.conf
sed -i '/^zookeeper_hosts/c\zookeeper_hosts = '$ZK_PORT_2181_TCP_ADDR:$ZK_PORT_2181_TCP_PORT'' /etc/midolman/midolman.conf 

exec /usr/share/midolman/midolman-start
