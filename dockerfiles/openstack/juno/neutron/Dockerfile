# Dockerfile to build a keystone service
FROM ubuntu:14.04
MAINTAINER Jaume Devesa "jaume@midokura.com"

RUN apt-get install -qqy software-properties-common
RUN apt-add-repository ppa:ubuntu-cloud-archive/juno-staging
RUN apt-get install -qqy curl 
ADD conf/midonet.list /etc/apt/sources.list.d/midonet.list
RUN curl -k http://repo.midonet.org/packages.midokura.key | apt-key add -
RUN apt-get -q update

RUN apt-get -qqy install python-neutron=1:2014.2.1-0ubuntu1~cloud0 && \
    apt-get -qqy install python-midonetclient && \
    apt-get -qqy install python-neutron-plugin-midonet

ADD conf/neutron.conf /etc/neutron/neutron.conf
ADD conf/midonet.ini /etc/neutron/plugins/midonet/midonet.ini
ADD conf/neutron-server /etc/default/neutron-server
