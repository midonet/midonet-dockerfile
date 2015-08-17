# Build Zookeeper
FROM ubuntu:14.04
MAINTAINER Jaume Devesa "jaume@midokura.com"

# Install zookeeper and dependences
RUN apt-get -q update && \
    apt-get install -qqy --no-install-recommends openjdk-7-jre-headless && \
    apt-get install -qqy zookeeper=3.4.5+dfsg-1 zookeeperd=3.4.5+dfsg-1

EXPOSE 2181

CMD ["/usr/share/zookeeper/bin/zkServer.sh", "start-foreground"]
