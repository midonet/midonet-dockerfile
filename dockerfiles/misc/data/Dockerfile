FROM busybox
MAINTAINER Midonet (http://midonet.org)

# This container will generate new passwords for
# OpenStack services and databases if the file
# mounted as volume does not exist in host machine
ADD bin/generate-passwords /usr/bin/generate-passwords

VOLUME ["/var/run/data"]     # Credentials directory
VOLUME ["/dbstorage"]        # Mysql data files mounted in mysql machine

CMD ["generate-passwords"]
