cmake_minimum_required(VERSION 3.23.3)
project(cpp-template)

set(CMAKE_CXX_STANDARD 23)

add_subdirectory(vendor)
include_directories(${CMAKE_SOURCE_DIR}/src)

# # for ffmpeg support
# add_definitions(-D__STDC_CONSTANT_MACROS)

add_library(cpp-template-libs INTERFACE IMPORTED)
target_link_libraries(cpp-template-libs INTERFACE dependencies)
target_include_directories(cpp-template-libs INTERFACE src)

target_sources(
  cpp-template-libs
  INTERFACE 
  src/pipeline/decoder.cpp
  # ADD YOUR SOURCE FILES
)


add_executable(cpp-template src/main.cpp)
if(BUILD_EXAMPLES)
	# ADD YOUR EXAMPLES
	add_executable(example_1 examples/example_1.cpp)
	target_link_libraries(example_1 PRIVATE cpp-template-libs)
	return()
endif()

# For sanitizers if needed
# target_compile_options(cpp-template PRIVATE -fsanitize=address)
# target_link_options(cpp-template PRIVATE -fsanitize=address)

target_link_libraries(cpp-template PRIVATE cpp-template-libs)
