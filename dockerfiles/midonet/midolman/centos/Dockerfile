# Dockerfile to build midolman rc version for centos
FROM centos:centos7
MAINTAINER Antoni Segura Puimedon "toni@midokura.com"

# Add the yum repo configuration file
ADD conf/midonet.repo /etc/yum.repos.d/midonet.repo

# Update repository
RUN yum update -y
RUN yum install -y midolman

# Add init script
ADD run_midolman.sh /opt/run_midolman.sh

# Run midolman by default
CMD /opt/run_midolman.sh
