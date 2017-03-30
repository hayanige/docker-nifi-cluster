#!/bin/bash
sed -i -e "s/^nifi.web.http.host=.*$/nifi.web.http.host=$(hostname)/g" /usr/local/nifi/conf/nifi.properties
sed -i -e "s/^nifi.cluster.node.address=.*$/nifi.cluster.node.address=$(hostname)/g" /usr/local/nifi/conf/nifi.properties
sed -i -e "s/^nifi.remote.input.host=.*$/nifi.remote.input.host=$(hostname)/g" /usr/local/nifi/conf/nifi.properties

/usr/local/nifi/bin/nifi.sh start
tail -f /dev/null
