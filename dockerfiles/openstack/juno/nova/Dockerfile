# Dockerfile to build the nova service
FROM ubuntu:14.04
MAINTAINER Midonet (http://midonet.org)

EXPOSE 6080 6081 8773, 8775

RUN apt-get install -qqy software-properties-common
RUN apt-add-repository ppa:ubuntu-cloud-archive/juno-staging
RUN apt-get -q update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -qqy nova-api=1:2014.2.1-0ubuntu1~cloud0 \
                                                        nova-cert=1:2014.2.1-0ubuntu1~cloud0 \
                                                        nova-conductor=1:2014.2.1-0ubuntu1~cloud0 \
                                                        nova-consoleauth=1:2014.2.1-0ubuntu1~cloud0 \
                                                        nova-novncproxy=1:2014.2.1-0ubuntu1~cloud0 \
                                                        nova-scheduler=1:2014.2.1-0ubuntu1~cloud0 \
                                                        python-novaclient \
                                                        supervisor=3.0b2-1

ADD conf/nova.conf /etc/nova/nova.conf
ADD conf/supervisor-nova.conf /etc/supervisor/conf.d/nova.conf
ADD bin/nova-start /usr/bin/nova-start

VOLUME ["/var/log/nova"]

CMD ["nova-start"]
