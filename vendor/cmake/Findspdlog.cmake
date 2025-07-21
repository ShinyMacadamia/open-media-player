set(SPDLOG_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/spdlog)
set(SPDLOR_BUILD_DIR ${SPDLOG_SOURCE_DIR}/build)

find_path(
	SPDLOG_INCLUDE_PATH
	NAMES spdlog/spdlog.h
	PATHS ${SPDLOG_SOURCE_DIR}/include
	NO_DEFAULT_PATH
	REQUIRED 
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(spdlog REQUIRED_VARS SPDLOG_INCLUDE_PATH)

add_library(spdlog INTERFACE)
target_include_directories(spdlog INTERFACE ${SPDLOG_INCLUDE_PATH})
