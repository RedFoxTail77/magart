#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5dcfdb3d6d59d0001b485c78/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5dcfdb3d6d59d0001b485c78
curl -s -X POST https://api.stackbit.com/project/5dcfdb3d6d59d0001b485c78/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5dcfdb3d6d59d0001b485c78/webhook/build/publish > /dev/null
