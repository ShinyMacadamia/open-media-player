#pragma once

#include <array>
extern "C" {
#include <libavutil/error.h>
}
#include <SDL3/SDL_pixels.h>
#include <concepts>
#include <exception>
#include <sstream>
#include <string>

namespace common {
class Exception : public std::exception {
public:
  template <typename... Args>
    requires(std::convertible_to<Args, std::string> && ...)
  Exception(Args &&...args) {
    std::stringstream s_stream;
    (s_stream << ... << args);
  };

  auto what() const noexcept -> const char * override {
    return reason_.c_str();
  }

  virtual ~Exception() {}

private:
  std::string reason_;
};

class FFmpegException : public Exception {
public:
  template <typename... Args>
  FFmpegException(int ffmpeg_ret, Args &&...args)
      : Exception{std::forward<Args>(args)..., AvErrorToString(ffmpeg_ret)} {}

  template <typename... Args>
  FFmpegException(Args &&...args) : Exception{std::forward<Args>(args)...} {}

  virtual ~FFmpegException() {}

private:
  static auto AvErrorToString(int ret) -> std::string {
    const auto buf_size = 1024;
    std::array<char, buf_size> err_buf{};
    return av_make_error_string(err_buf.data(), buf_size, ret);
  }
};
} // namespace common
