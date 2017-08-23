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

secgroupcount=$(cf security-groups | grep $SECURITY_GROUP_NAME | wc -l)

echo $SECURITY_GROUP_VALUE > /tmp/sec.json

if [ $secgroupcount -eq 0 ];
  then
    echo "security group not found by name, need to create it"
    cf create-security-group $SECURITY_GROUP_NAME /tmp/sec.json
  else
    echo "security group found by name, need to update it"
    cf update-security-group $SECURITY_GROUP_NAME /tmp/sec.json
fi

rm -rf /tmp/sec.json
