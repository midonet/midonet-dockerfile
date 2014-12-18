# Dockerfile to build the mysql service
FROM ubuntu:14.04
MAINTAINER Midonet (http://midonet.org)

EXPOSE 3306

RUN apt-get -q update

# Configure and install Mariadb
RUN DEBIAN_FRONTEND=noninteractive apt-get -qqy install mariadb-server-5.5 python-mysqldb

ADD conf/my.cnf /etc/mysql/my.cnf
ADD bin/mysql-start /usr/bin/mysql-start

CMD ["mysql-start"]
