FROM ubuntu:14.04
MAINTAINER MidoNet (http://midonet.org)

RUN apt-get -y update
RUN apt-get -qqy install ruby=1:1.9.3.4 \
                         ruby-dev=1:1.9.3.4 \
                         build-essential
RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc
RUN gem install puppet -v 3.7.3
RUN gem install librarian-puppet -v 2.0.1
