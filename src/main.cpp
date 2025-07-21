#include <common/exception.h>
#include <filesystem>
#include <pipeline/decoder.h>
#include <print>

int main(int argc, char *argv[]) {
  if (argc < 2) {
    std::println("Usage: videoplayer <path-to-video-file>");
    return 0;
  }
  std::filesystem::path path{argv[1]};
  if (!std::filesystem::exists(path)) {
    std::println("File path doesn't exists: {}", argv[1]);
    return 0;
  }
  AVPacket *packet = av_packet_alloc();
  Decoder decoder{argv[1]};
  decoder.Decode(packet);
}
