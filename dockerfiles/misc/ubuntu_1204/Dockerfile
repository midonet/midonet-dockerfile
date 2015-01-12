FROM ubuntu:12.04
MAINTAINER MidoNet (http://midonet.org)

RUN apt-get -y update
RUN apt-get -qqy install ruby1.9.1=1.9.3.0-1ubuntu2.10 \
                         ruby1.9.1-dev=1.9.3.0-1ubuntu2.10 \
                         build-essential

RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc
RUN gem install puppet -v 3.7.3
RUN gem install librarian-puppet -v 2.0.1
