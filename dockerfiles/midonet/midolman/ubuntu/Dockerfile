# Dockerfile to build midolman rc version for ubuntu
FROM ubuntu:14.04
MAINTAINER Jaume Devesa "jaume@midokura.com"

# Add the apt configuration file
ADD conf/midonet.list /etc/apt/sources.list.d/midonet.list
RUN apt-get install -qqy curl
RUN curl -k http://repo.midonet.org/packages.midokura.key | apt-key add -

# Update repository
RUN apt-get -q update
RUN apt-get install -qqy midolman

# Add init script
ADD run_midolman.sh /opt/run_midolman.sh

# Run midolman by default
CMD /opt/run_midolman.sh
