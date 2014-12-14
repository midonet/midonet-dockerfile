# Dockerfile to build midolman-api rc version for ubuntu
FROM ubuntu:14.04
MAINTAINER Jaume Devesa "jaume@midokura.com"

# Expose port for other processes
EXPOSE 8080

# Add the apt configuration file
RUN apt-get install -qqy curl 
ADD conf/midonet.list /etc/apt/sources.list.d/midonet.list
RUN curl -k http://repo.midonet.org/packages.midokura.key | apt-key add -

# Install dependences
RUN apt-get -q update
RUN apt-get install -qqy python-midonetclient

# Configure midonet-api
ADD conf/midonetrc /root/.midonetrc
