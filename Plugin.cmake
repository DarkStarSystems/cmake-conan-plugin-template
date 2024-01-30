# Build a Plugin

function(add_plugin)
  # Call like: add_plugin(TARGET foo SOURCES ...)
  set(options)
  set(oneValueArgs TARGET)
  set(multiValueArgs SOURCES)
  cmake_parse_arguments(PARSE_ARGV 0 PLUGIN
    "${options}" "${oneValueArgs}" "${multiValueArgs}")

  if(NOT PLUGIN_TARGET)
    message(FATAL_ERROR "add_plugin: no TARGET")
  endif()
  message(STATUS "Building Plugin ${PLUGIN_TARGET}")

  add_library(${PLUGIN_TARGET} MODULE ${PLUGIN_SOURCES})

  target_link_libraries(${PLUGIN_TARGET} PRIVATE spdlog::spdlog_header_only)

  target_compile_features(${PLUGIN_TARGET} PUBLIC cxx_std_20)
  set_target_properties(
    ${PLUGIN_TARGET} PROPERTIES
    SUFFIX .plugin
    PREFIX ""
    BUNDLE True                 # build as CFBundle on MacOS
    MACOSX_BUNDLE_GUI_IDENTIFIER local.test.plugin
    CXX_VISIBILITY_PRESET hidden
    VISIBILITY_INLINES_HIDDEN True
  )

endfunction()
