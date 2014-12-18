# Nova-compute based on last version of midolman image
FROM midonet/midolman
MAINTAINER Midonet (http://midonet.org)

EXPOSE 8774

RUN apt-get install -qqy software-properties-common
RUN apt-add-repository ppa:ubuntu-cloud-archive/juno-staging
RUN apt-get -q update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -qqy nova-compute=1:2014.2.1-0ubuntu1~cloud0 \
                                                        sysfsutils \
                                                        supervisor=3.0b2-1

ADD conf/nova.conf /etc/nova/nova.conf
ADD conf/nova-compute.conf /etc/nova/nova-compute.conf
ADD conf/qemu.conf /etc/libvirt/qemu.conf
ADD conf/libvirtd.conf /etc/libvirt/libvirtd.conf
ADD conf/supervisor-novacompute.conf /etc/supervisor/conf.d/nova-compute.conf
ADD bin/nova-compute-start /usr/bin/nova-compute-start

CMD ["nova-compute-start"]
