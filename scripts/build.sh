#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <target>" >&2
  exit 1
fi

source ./build/envsetup.sh
export TARGET_UNOFFICIAL_BUILD_ID=whitequark
export LINEAGE_VERSION_APPEND_TIME_OF_DAY=true
brunch lineage_$1-user || exit 1
./vendor/extra/scripts/sign.sh || exit 1
