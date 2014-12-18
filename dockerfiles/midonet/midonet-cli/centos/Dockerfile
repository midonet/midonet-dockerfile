# Dockerfile to build midolman-api rc version for centos7
FROM centos:centos7
MAINTAINER Antoni Segura Puimedon "toni@midokura.com"

# Expose port for other processes
EXPOSE 8080

# Add the yum repo configuration file
ADD conf/midonet.repo /etc/yum.repos.d/midonet.repo
# Add the EPEL yum repo for the python-midonetclient dependencies
RUN yum install -y http://download.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm

# Install dependences
RUN yum update -y
RUN yum install -y python-midonetclient

# Configure midonet-api
ADD conf/midonetrc /root/.midonetrc
