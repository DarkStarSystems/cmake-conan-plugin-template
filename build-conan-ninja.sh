#!/usr/bin/env bash

# Ninja multi-config build

set -e

echo '############ Configuring with conan for Ninja multi ########'
# Install debug and release versions of dependencies
set -x
conan install . --build=missing -c tools.cmake.cmaketoolchain:generator="Ninja Multi-Config" \
      -s build_type=Debug
conan install . --build=missing -c tools.cmake.cmaketoolchain:generator="Ninja Multi-Config"
# configure cmake to create ninja build files
cmake --preset conan-default

echo '############ Building with cmake & ninja, debug and release ####################'
cmake --build --preset conan-debug
cmake --build --preset conan-release
