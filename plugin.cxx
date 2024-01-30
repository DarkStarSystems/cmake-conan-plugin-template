#include "spdlog/spdlog.h"

// Plugin API should be C-based
extern "C" {
  void plugin_main();
}

__attribute__((visibility("default")))
void plugin_main() {
  spdlog::info("In plugin_main");
}
