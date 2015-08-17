# Build cassandra 2.0
FROM ubuntu:14.04
MAINTAINER Jaume Devesa "jaume@midokura.com"

# Expose all cassandra ports
EXPOSE 7000 7001 7199 9042 9160

# Configure cassandra repos
RUN apt-get install -qqy curl
RUN echo "deb http://debian.datastax.com/community stable main" > /etc/apt/sources.list.d/cassandra.list
RUN curl -L http://debian.datastax.com/debian/repo_key | apt-key add - 

# Install dependences
RUN apt-get -q update && \
    apt-get install -qqy openjdk-7-jre-headless && \
    apt-get install -qqy dsc21

# Configure cassandra
ADD cassandra.yaml /etc/cassandra/cassandra.yaml
ADD cassandra-env.sh /etc/cassandra/cassandra-env.sh
ADD run_cassandra.sh /opt/run_cassandra.sh

CMD ["/opt/run_cassandra.sh"]
