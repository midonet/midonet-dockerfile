FROM centos:centos6.6
MAINTAINER MidoNet (http://midonet.org)
 
RUN yum install -y wget tar bzip2 \  
                   gcc make autoconf automake

WORKDIR /tmp
RUN wget -O ruby-install-0.5.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.5.0.tar.gz
RUN tar xzf /tmp/ruby-install-0.5.0.tar.gz && cd ruby-install-0.5.0 && make install
RUN ruby-install --install-dir /usr/ ruby 1.9.3-p547
RUN gem install --no-ri --no-rdoc librarian-puppet -v 2.0.1 && gem install --no-ri --no-rdoc puppet -v 3.7.3
RUN rm -rf /tmp/ruby-install*
WORKDIR /

RUN yum install -y redhat-lsb-core
RUN mkdir /etc/puppet
 
CMD ["/bin/bash"]
