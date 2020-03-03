#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e5e20e0245c5e001938a7ba/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e5e20e0245c5e001938a7ba
curl -s -X POST https://api.stackbit.com/project/5e5e20e0245c5e001938a7ba/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e5e20e0245c5e001938a7ba/webhook/build/publish > /dev/null
