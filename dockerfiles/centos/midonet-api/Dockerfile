# Dockerfile to build midolman-api rc version for centos7
FROM centos:centos7
MAINTAINER Antoni Segura Puimedon "toni@midokura.com"

# Expose port for other processes
EXPOSE 8080

# Add the yum repo configuration file
ADD conf/midonet.repo /etc/yum.repos.d/midonet.repo

# Install dependences
RUN yum update -y
RUN yum install -y tomcat midonet-api

# Configure midonet-api
ADD conf/midonet-api.xml /etc/tomcat/Catalina/localhost/midonet-api.xml
ADD bin/run_midonetapi.sh /opt/run_midonetapi.sh

# Run midonet-api script by default
CMD /opt/run_midonetapi.sh
