FROM ubuntu-upstart:12.04
MAINTAINER MidoNet (http://midonet.org)

RUN apt-get -y update
RUN apt-get -qqy install ruby1.9.1=1.9.3.0-1ubuntu2.10 \
                         ruby1.9.1-dev=1.9.3.0-1ubuntu2.10 \
                         build-essential

RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc
RUN gem install puppet -v 3.7.3
RUN gem install librarian-puppet -v 2.0.1

# We have to deceive the container: if we want to install midolman we need a
# 3.13 kernel image. The kernel is the kernel of the host. But we need to have
# a dummy package to let midolman be installed.
ADD linux-image-generic-dummy /tmp/linux-image-generic-dummy
WORKDIR /tmp
RUN apt-get -qqy install equivs
RUN equivs-build linux-image-generic-dummy
RUN dpkg -i linux-image-generic_3.13.0_all.deb

RUN apt-get -qqy install lsb-release
RUN mkdir /etc/puppet
RUN locale-gen en_US.UTF-8

CMD ["/sbin/init"]
