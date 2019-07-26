#!/usr/bin/env bash

set -e
set -o pipefail
set -v

if [[ -z "${STACKBIT_API_KEY}" ]]; then
    echo "WARNING: No STACKBIT_API_KEY environment variable set, skipping stackbit-pull"
else
    npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://530d2cf8.ngrok.io/pull/5d3b40e85fff43c7c5e5ea13 
fi
./ssg-build.sh
./inject-netlify-cms.js public
