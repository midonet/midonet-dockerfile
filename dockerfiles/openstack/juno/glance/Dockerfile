# Dockerfile to build the glance service
FROM ubuntu:14.04
MAINTAINER Midonet (http://midonet.org)

EXPOSE 9292 9191

RUN apt-get install -qqy software-properties-common
RUN apt-add-repository ppa:ubuntu-cloud-archive/juno-staging
RUN apt-get -q update

RUN apt-get install -qqy glance=1:2014.2.1-0ubuntu1~cloud0 && \
    apt-get install -qqy python-mysqldb && \
    apt-get install -qqy supervisor=3.0b2-1

ADD conf/glance-api.conf /etc/glance/glance-api.conf
ADD conf/supervisor-glance.conf /etc/supervisor/conf.d/glance.conf
ADD bin/glance-start /usr/bin/glance-start

VOLUME ["/var/lib/glance/images"]
VOLUME ["/var/log/nova"]

CMD ["glance-start"]
