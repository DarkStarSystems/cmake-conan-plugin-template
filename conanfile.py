from conan import ConanFile
from conan.tools.cmake import cmake_layout

class PluginRecipe(ConanFile):
    settings = "os", "compiler", "build_type", "arch"
    generators = "CMakeDeps", "CMakeToolchain"
    requires = 'spdlog/1.13.0'
    default_options = {"spdlog/*:header_only": True,
                       "fmt/*:header_only": True}

    def layout(self):
        cmake_layout(self)
