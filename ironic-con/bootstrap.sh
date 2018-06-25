#!/bin/bash

set -x

envsubst < /ironic.conf > ironic/etc/ironic/ironic.conf.local

egrep -v "^$|^#" /ironic/etc/ironic/ironic.conf.local

ironic-conductor -d --config-file /ironic/etc/ironic/ironic.conf.local

