FROM registry.redhat.io/amq7/amq-broker-init-rhel8:0.4
COPY ./config/ /amq/scripts/
