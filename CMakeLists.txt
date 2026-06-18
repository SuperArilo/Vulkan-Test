cmake_minimum_required(VERSION 3.10)

if (POLICY CMP0141)
  cmake_policy(SET CMP0141 NEW)
  set(CMAKE_MSVC_DEBUG_INFORMATION_FORMAT "$<IF:$<AND:$<C_COMPILER_ID:MSVC>,$<CXX_COMPILER_ID:MSVC>>,$<$<CONFIG:Debug,RelWithDebInfo>:EditAndContinue>,$<$<CONFIG:Debug,RelWithDebInfo>:ProgramDatabase>>")
endif()

project("Vulkan")

add_executable(Vulkan "main.cpp" "lve_window.cpp" "lve_window.h"  "app.h" "app.cpp")

if (CMAKE_VERSION VERSION_GREATER 3.12)
    set_property(TARGET Vulkan PROPERTY CXX_STANDARD 20)
endif()

find_package(glfw3 CONFIG REQUIRED)
find_package(Vulkan REQUIRED)

target_link_libraries(Vulkan PRIVATE glfw Vulkan::Vulkan)