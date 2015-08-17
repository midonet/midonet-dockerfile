FROM centos:7
MAINTAINER MidoNet (http://midonet.org)
 
# Install systemd
ENV container docker
RUN yum -y swap -- remove fakesystemd -- install systemd systemd-libs
RUN yum -y update; yum clean all; \
    (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/*;\
    rm -f /etc/systemd/system/*.wants/*;\
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*;\
    rm -f /lib/systemd/system/anaconda.target.wants/*;

# Install dependences to build ruby
RUN yum install -y wget tar bzip2 \  
                   gcc make autoconf automake \
                   redhat-lsb-core

# Build ruby from sources
WORKDIR /tmp
RUN wget -O ruby-install-0.5.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.5.0.tar.gz
RUN tar xzf /tmp/ruby-install-0.5.0.tar.gz && cd ruby-install-0.5.0 && make install
RUN ruby-install --install-dir /usr/ ruby 1.9.3-p547
RUN gem install --no-ri --no-rdoc librarian-puppet -v 2.0.1 && gem install --no-ri --no-rdoc puppet -v 3.7.3
RUN rm -rf /tmp/ruby-install*
WORKDIR /

RUN mkdir /etc/puppet

RUN rm /usr/lib/tmpfiles.d/systemd-nologin.conf

VOLUME ["/sys/fs/cgroup"]

CMD ["/usr/sbin/init"]
