cmake_minimum_required(VERSION 3.23.3)
project(dependencies)

set(CMAKE_CXX_STANDARD 23)

set(DEPENDENCY_DIR ${CMAKE_CURRENT_SOURCE_DIR})

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
list(APPEND CMAKE_PREFIX_PATH "${CMAKE_CURRENT_SOURCE_DIR}/include")

add_library(dependencies INTERFACE)

find_package(PkgConfig REQUIRED)

pkg_check_modules(
  LIBAV
  REQUIRED
  libavcodec
  libavformat
  libavutil
)

list(APPEND INCLUDE_LIBS ${LIBAV_LIBRARIES})
target_include_directories(dependencies INTERFACE ${LIBAV_INCLUDE_DIRS})

find_package(SDL3 REQUIRED)
list(APPEND INCLUDE_LIBS SDL3::SDL3)

target_link_libraries(
        dependencies INTERFACE
        ${INCLUDE_LIBS}
)
