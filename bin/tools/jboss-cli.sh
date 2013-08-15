#!/bin/bash
export JAVA_OPTS="-Djboss.management.client_socket_bind_address=$OPENSHIFT_IMMUTANT_IP"
${OPENSHIFT_IMMUTANT_DIR}/bin/jboss-cli.sh "$@"
