# Build a Plugin

function(add_plugin)
  # Call like: add_plugin(TARGET foo SOURCES ...)
  set(options)
  set(oneValueArgs TARGET)
  set(multiValueArgs SOURCES)
  cmake_parse_arguments(PARSE_ARGV 0 PLUGIN
    "${options}" "${oneValueArgs}" "${multiValueArgs}")

  if(NOT PLUGIN_TARGET)
    message(FATAL_ERROR "add_ae_plugin: no TARGET")
  endif()
  message(STATUS "Building Plugin ${PLUGIN_TARGET}")

  add_library(${PLUGIN_TARGET} MODULE ${PLUGIN_SOURCES})

  target_link_libraries(${PLUGIN_TARGET} spdlog::spdlog)

endfunction()
