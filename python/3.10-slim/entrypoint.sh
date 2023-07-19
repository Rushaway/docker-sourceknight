#!/bin/bash

set -e

config_name="sourceknight.yaml"
config_exist=$(test -f "$config_name"; echo $?)

if [[ "$config_exist" == "0" ]]; then
    BUILD_ROOT=$(cat sourceknight.yaml | yq '.project.root' | tr -d '"')
    BUILD_OUTPUT=$(cat sourceknight.yaml | yq '.project.output' | tr -d '"')
    if [[ "$BUILD_OUTPUT" == "null" || "$BUILD_OUTPUT" == "" ]]; then
        BUILD_OUTPUT="${BUILD_ROOT}/addons/sourcemod/plugins"
    fi

    if [[ ${BUILD_OUTPUT::1} == "/" ]]; then
        BUILD_OUTPUT=".${BUILD_OUTPUT}"
    fi

    echo "Build output: $BUILD_OUTPUT"
fi

sh -c "sourceknight $*"

mkdir -p .sourceknight/package/common/addons/sourcemod/plugins

if [[ -d "${BUILD_OUTPUT}" ]]; then
    cp -R ${BUILD_OUTPUT}/* .sourceknight/package/common/addons/sourcemod/plugins
fi
