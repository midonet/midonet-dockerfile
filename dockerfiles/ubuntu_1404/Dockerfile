FROM ubuntu-upstart:14.04
MAINTAINER MidoNet (http://midonet.org)

RUN apt-get -y update
RUN apt-get -qqy install ruby=1:1.9.3.4 \
                         ruby-dev=1:1.9.3.4 \
                         build-essential
RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc
RUN gem install puppet -v 3.7.3
RUN gem install librarian-puppet -v 2.0.1
RUN mkdir /etc/puppet
RUN locale-gen en_US.UTF-8

RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
RUN echo "UseDNS no" >> /etc/ssh/sshd_config
RUN sed -i -e "s/UsePAM yes/UsePAM no/" /etc/ssh/sshd_config

CMD ["/sbin/init"]
