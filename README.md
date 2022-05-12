# amq-init-cfg
Init-Container for AMQ with custom config

This is an example on how to provide custom configuration to AMQ Broker using the method / approach [described in the docs](https://access.redhat.com/documentation/en-us/red_hat_amq/2020.q4/html-single/deploying_amq_broker_on_openshift/index#proc-br-specifying-custom-init-container_broker-ocp)
The finally used broker.xml config file is in the pod located at `/amq/init/config/amq-broker`
