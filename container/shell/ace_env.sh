#!/bin/bash

if [ -z "$MQSI_VERSION" ]; then
  echo "Sourcing profile"
  source /opt/ibm/ace-12/server/bin/mqsiprofile
fi
