# Build a plugin (dll, shared library)

cmake_minimum_required(VERSION 3.26)

project(plugin-template CXX)

set(CMAKE_VERBOSE_MAKEFILE 1)
set(CMAKE_EXPORT_COMPILE_COMMANDS True)

find_package(spdlog)

include(Plugin.cmake)

add_plugin(TARGET test-plugin
  SOURCES plugin.cxx
)
