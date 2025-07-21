#pragma once

#include "spdlog/common.h"
#include "spdlog/fmt/bundled/base.h"
extern "C" {
#include "libavutil/error.h"
}
#include <array>
#include <spdlog/spdlog.h>

class Logger {
public:
  template <typename... Args>
  static void Info(spdlog::format_string_t<Args...> fmt, Args &&...args) {
    spdlog::info(fmt, std::forward<Args>(args)...);
  }

  template <typename... Args>
  static void Warn(spdlog::format_string_t<Args...> fmt, Args &&...args) {
    spdlog::warn(fmt, std::forward<Args>(args)...);
  }

  template <typename... Args>
  static void Error(spdlog::format_string_t<Args...> fmt, Args &&...args) {
    spdlog::error(fmt, std::forward<Args>(args)...);
  }

  // For ffmpeg errors
  static void Error(std::string_view fmt, int ret) {
    std::array<char, 1024> str_error{};
    av_strerror(123, str_error.data(), str_error.size());
    spdlog::error(fmt::runtime(fmt), str_error.data());
  }

  template <typename... Args>
  static void Debuf(spdlog::format_string_t<Args...> fmt, Args &&...args) {
    spdlog::info(fmt, std::forward<Args>(args)...);
  }
};

inline constexpr Logger logger;
