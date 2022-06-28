#!/bin/bash
echo "############# Custom Config Script ###############"
echo "##                                              ##"
echo "##      This is a custom configure script.      ##"
echo "##                                              ##"
echo "##################################################"

echo "#### The config dir locates at ${CONFIG_INSTANCE_DIR} ####"

echo "Enabling Heap Dump"
echo '' >>"${CONFIG_INSTANCE_DIR}"/etc/artemis.profile
echo '# Enabling dumps' >>"${CONFIG_INSTANCE_DIR}"/etc/artemis.profile
echo 'JAVA_ARGS="$JAVA_ARGS -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/opt/amq-broker/data"' >>"${CONFIG_INSTANCE_DIR}"/etc/artemis.profile
echo 'JAVA_ARGS="$JAVA_ARGS $JAVA_EXTRA_ARGS"' >>"${CONFIG_INSTANCE_DIR}"/etc/artemis.profile


echo "Adding wildcard config to broker config"
# this searches for the </core> tag in the config at replaces
# it with the content of the wildcard.xml file
sed -e '/\/core/r /amq/scripts/custom-config.xml' -e '/\/core/d' ${CONFIG_INSTANCE_DIR}/etc/broker.xml >${CONFIG_INSTANCE_DIR}/etc/broker_new.xml

echo "Copying broker_new.xml to  ${CONFIG_INSTANCE_DIR}/etc/broker.xml"
cp ${CONFIG_INSTANCE_DIR}/etc/broker_new.xml ${CONFIG_INSTANCE_DIR}/etc/broker.xml


echo "#### Custom config done. ####"
