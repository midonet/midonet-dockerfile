#!/bin/bash

# Parse the IP address of the container
IP=$(ifconfig eth0 2>/dev/null|awk '/inet addr:/ {print $2}'|sed 's/addr://')
sed -i '/rpc_address/c\rpc_address: '$IP'' /etc/cassandra/cassandra.yaml
exec cassandra -f
