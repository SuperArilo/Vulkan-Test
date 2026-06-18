cmake_minimum_required(VERSION 3.10)

project("Vulkan")

add_executable(Vulkan "main.cpp" "lve_window.cpp" "lve_window.h"  "app.h" "app.cpp"
    lve_pipeline.cpp)

if (CMAKE_VERSION VERSION_GREATER 3.12)
    set_property(TARGET Vulkan PROPERTY CXX_STANDARD 20)
endif()

find_package(glfw3 CONFIG REQUIRED)
find_package(Vulkan REQUIRED)

target_link_libraries(Vulkan PRIVATE glfw Vulkan::Vulkan)