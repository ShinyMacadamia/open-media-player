cmake_minimum_required(VERSION 3.23.3)
project(dependencies)

set(CMAKE_CXX_STANDARD 23)

set(DEPENDENCY_DIR ${CMAKE_CURRENT_SOURCE_DIR})

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
list(APPEND CMAKE_PREFIX_PATH "${CMAKE_CURRENT_SOURCE_DIR}/include")

add_library(dependencies INTERFACE)

target_link_libraries(
        dependencies INTERFACE
        ${INCLUDE_LIBS}
)
