#pragma once

#include <filesystem>
#include <functional>
#include <vector>
extern "C" {
#include <libavcodec/avcodec.h>
#include <libavformat/avformat.h>
}

struct StreamMapping {
  int input_idx;
  int output_idx;
};

class Decoder {
public:
  Decoder(const std::filesystem::path &path);
  ~Decoder();

  void Decode(AVPacket *packet);

private:
  void InitDecoder();
  auto FindStream(int idx) -> int;

  AVFormatContext *demuxer_ctx_ = nullptr;
  AVCodecContext *decoder_ctx_ = nullptr;
  AVFrame *frame_ = av_frame_alloc();
  std::vector<StreamMapping> stream_mapping_;
  std::function<bool(int)> find_fn_;
};
