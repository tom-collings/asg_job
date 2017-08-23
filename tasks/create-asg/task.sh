#!/bin/bash

set -eu

echo "Hello Concourse World"

if [ $SKIP_SSL_VALIDATION == "true" ];
  then
    cf api $CF_API_ENDPOINT --skip-ssl-validation
  else
    cf api $CF_API_ENDPOINT
fi

cf auth $CF_USERNAME $CF_PASSWORD

cf target -o $CF_ORG -s $CF_SPACE
