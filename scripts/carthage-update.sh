#!/bin/sh
#set -euo pipefail
#carthage update --platform iOS --use-xcframeworks

PROJECT_DIR=$(dirname "$PWD")

pushd $PROJECT_DIR
echo -e "当前路径: [$PWD]"
./scripts/carthage.sh update --platform iOS --cache-builds
#./scripts/carthage.sh bootstrap --use-xcframeworks --no-use-binaries
#./scripts/carthage.sh bootstrap --platform iOS --use-xcframeworks --no-use-binaries
popd 

