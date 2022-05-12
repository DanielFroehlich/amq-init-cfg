#!/bin/bash
echo "############## Example Custom Script ###############"
echo "##                                                ##"
echo "##      This is an example configure script.      ##"
echo "##                                                ##"
echo "####################################################"

echo "#### The config dir locates at ${CONFIG_INSTANCE_DIR} ####"
ls ${CONFIG_INSTANCE_DIR}
echo Adding a new account "test" with password "test"
printf '\n' >> ${CONFIG_INSTANCE_DIR}/etc/artemis-users.properties
echo "test = test" >> ${CONFIG_INSTANCE_DIR}/etc/artemis-users.properties
# visitor has role 'viewer'
# /etc/artemis-roles.properties
echo "adding test role as viewer"
printf '\n' >> "${CONFIG_INSTANCE_DIR}"/etc/artemis-roles.properties
echo "viewer = test" >> ${CONFIG_INSTANCE_DIR}/etc/artemis-roles.properties
## Add role 'viewer' to HAWTIO_ROLE so that it can login to the console
sed -i "s/hawtio.role=admin/hawtio.role=admin,viewer/g" ${CONFIG_INSTANCE_DIR}/etc/artemis.profile


echo "### Adding wildcard config to broker config"
# this searches for the </core> tag in the config at replaces
# it with the content of the wildcard.xml file
sed -e '/\/core/r /amq/scripts/custom-config.xml' -e '/\/core/d' ${CONFIG_INSTANCE_DIR}/etc/broker.xml >${CONFIG_INSTANCE_DIR}/etc/broker_new.xml

echo "### Copying broker_new.xml to  ${CONFIG_INSTANCE_DIR}/etc/broker.xml"
cp ${CONFIG_INSTANCE_DIR}/etc/broker_new.xml ${CONFIG_INSTANCE_DIR}/etc/broker.xml


echo "#### Custom config done. ####"
