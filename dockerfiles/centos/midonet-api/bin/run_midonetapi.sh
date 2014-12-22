#!/bin/bash

# Edit web.xml

MIDONET_API_CFG=/usr/share/midonet-api/WEB-INF/web.xml
if [ -z $IP ]; then
  IP=$(ip -4 a show dev eth0 | grep inet | awk '{print $2;}' | cut -d'/' -f1)
fi

sed -i -e "/<param-name>rest_api-base_uri<\/param-name>/{n;s%.*%    <param-value>http://"$IP":8080/midonet-api</param-value>%g}" $MIDONET_API_CFG
sed -i -e "/<param-name>zookeeper-zookeeper_hosts<\/param-name>/{n;n;s%.*%    <param-value>"$ZK_PORT_2181_TCP_ADDR:$ZK_PORT_2181_TCP_PORT"</param-value>%g}" $MIDONET_API_CFG
sed -i -e "s/org.midonet.api.auth.keystone.v2_0.KeystoneService/org.midonet.api.auth.MockAuthService/g" $MIDONET_API_CFG

# Run tomcat
exec java -classpath /usr/share/tomcat/bin/bootstrap.jar:/usr/share/tomcat/bin/tomcat-juli.jar:/usr/share/java/commons-daemon.jar -Dcatalina.base=/usr/share/tomcat -Dcatalina.home=/usr/share/tomcat -Djava.endorsed.dirs= -Djava.io.tmpdir=/var/cache/tomcat/temp -Djava.util.logging.config.file=/usr/share/tomcat/conf/logging.properties -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager org.apache.catalina.startup.Bootstrap start
