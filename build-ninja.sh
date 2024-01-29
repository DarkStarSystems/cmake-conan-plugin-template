#!/usr/bin/env bash

# Ninja multi-config build

set -e

echo '############ Configuring with conan and cmake and Ninja (using conan-cmake integration) ########'
cmake --preset default -G "Ninja Multi-Config"
echo '############ Building with cmake, for debug and release ####################'
cmake --build --preset default --config Debug
cmake --build --preset default --config Release
