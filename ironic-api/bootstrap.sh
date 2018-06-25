#!/bin/bash

set -x

# Subsitute variables with environment variables
envsubst < /ironic.conf > ironic/etc/ironic/ironic.conf.local

# Print configurations for debug
egrep -v "^$|^#" /ironic/etc/ironic/ironic.conf.local

ironic-dbsync -d --config-file /ironic/etc/ironic/ironic.conf.local create_schema

ironic-api -d --config-file /ironic/etc/ironic/ironic.conf.local

