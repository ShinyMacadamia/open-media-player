#include <pipeline/decoder.h>
extern "C" {
#include <libavcodec/avcodec.h>
#include <libavcodec/codec.h>
#include <libavformat/avformat.h>
#include <libavutil/avutil.h>
}
#include <common/exception.h>

Decoder::Decoder(const std::filesystem::path &path) {
  if (auto ret =
          avformat_open_input(&demuxer_ctx_, path.c_str(), nullptr, nullptr);
      ret != 0) {
    throw common::FFmpegException(ret,
                                  "Cannot open file with avformat_open_input");
  }
  if (auto ret = avformat_find_stream_info(demuxer_ctx_, nullptr); ret != 0) {
    throw common::FFmpegException(
        ret, "Cannot find stream info with avformat_find_stream_info");
  }
}

Decoder::~Decoder() {
  if (decoder_ctx_) {
    avcodec_free_context(&decoder_ctx_);
  }
  if (demuxer_ctx_) {
    avformat_close_input(&demuxer_ctx_);
  }
}

void Decoder::InitDecoder() {
  AVStream *av_stream = nullptr;
  const AVCodec *codec;
  auto ret = -1;
  if (ret = av_find_best_stream(demuxer_ctx_, AVMEDIA_TYPE_VIDEO, -1, -1,
                                &codec, 0);
      ret > 0) {
    throw common::FFmpegException(
        ret, "Cannot find a suitable stream for the decoder");
  }
  // TODO maybe add handling for several streams in a future
  stream_mapping_.emplace_back(
      StreamMapping{.input_idx = ret, .output_idx = 0});
  decoder_ctx_ = avcodec_alloc_context3(codec);
  if (!decoder_ctx_) {
    throw common::FFmpegException("Failed to allocate decoder context for ",
                                  av_get_media_type_string(AVMEDIA_TYPE_VIDEO));
  }
  if (ret = avcodec_open2(decoder_ctx_, codec, nullptr); ret != 0) {
    throw common::FFmpegException(ret, "Cannot open the decoder:");
  }
}

auto Decoder::FindStream(int idx) -> int {
  for (const auto &[input_stream_idx, output_stream_idx] : stream_mapping_) {
    if (input_stream_idx == idx) {
      return output_stream_idx;
    }
  }
  return -1;
}

void Decoder::Decode(AVPacket *packet) {
  while (av_read_frame(demuxer_ctx_, packet) >= 0) {
    if (FindStream(packet->stream_index) != -1) {
      if (auto ret = avcodec_send_packet(decoder_ctx_, packet); ret < 0) {
        Logger
      }
    }
  }
}
