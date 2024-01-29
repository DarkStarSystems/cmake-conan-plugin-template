#!/usr/bin/env bash

set -e

PRESET=${1:-Release}

# Removing build dir isn't enough to clean, because of CMakeUserPresets
if [[ -e CMakeUserPresets.json && ! -d build ]]; then
    rm CMakeUserPresets.json
fi

echo '############ Configuring with conan and cmake (using conan-cmake integration) ########'
cmake --preset $PRESET
echo '############ Building with cmake --build --preset default ####################'
cmake --build --preset $PRESET
