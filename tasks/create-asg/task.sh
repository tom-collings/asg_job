#!/bin/bash

set -eu

echo "Hello Concourse World"

cf api $CF_API_ENDPOINT $SKIP_SSL_VALIDATION

cf auth $CF_USERNAME $CF_PASSWORD

cf target -o $CF_ORG -s $CF_SPACE
