FROM centos:centos7
MAINTAINER MidoNet (http://midonet.org)
 
RUN yum install -y scl-utils
RUN yum localinstall -y https://www.softwarecollections.org/en/scls/rhscl/v8314/epel-7-x86_64/download/rhscl-v8314-epel-7-x86_64.noarch.rpm
RUN yum install -y v8314
RUN yum localinstall -y https://www.softwarecollections.org/en/scls/rhscl/ruby193/epel-7-x86_64/download/rhscl-ruby193-epel-7-x86_64.noarch.rpm
RUN yum install -y ruby193 ruby193-ruby-devel
RUN yum update -y
RUN yum install -y autoconf automake make gcc
 
RUN scl enable ruby193 "gem install --no-ri --no-rdoc librarian-puppet -v 2.0.1 && gem install --no-ri --no-rdoc puppet -v 3.7.3"
RUN echo "source /opt/rh/ruby193/enable" > /etc/profile.d/ruby193.sh
RUN echo "export PATH=/opt/rh/ruby193/root/usr/local/bin/:$PATH" >> /etc/profile.d/ruby193.sh
 
CMD ["/bin/bash"]
