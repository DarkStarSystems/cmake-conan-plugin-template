# Build a plugin (dll, shared library)

cmake_minimum_required(VERSION 3.26)

project(plugin-template CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_VERBOSE_MAKEFILE 1)

find_package(spdlog)

include(Plugin.cmake)

add_plugin(TARGET plugin
  SOURCES plugin.cxx
)
