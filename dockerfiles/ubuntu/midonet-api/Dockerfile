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
RUN apt-get install -qqy tomcat7 midonet-api

# Configure midonet-api
ADD conf/midonet-api.xml /etc/tomcat7/Catalina/localhost/midonet-api.xml
ADD bin/run_midonetapi.sh /opt/run_midonetapi.sh

# Run midonet-api script by default
CMD /opt/run_midonetapi.sh
