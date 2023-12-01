import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';

class HTVideoDescProviderBase extends ChangeNotifier {
  ///more info 是否展开
  var htVarInfoShown = false;
  ///是否展开详情
  var isAllEpisodes = false;


  String? vid;//电影或电视剧ID（没有传0）
  String? sid;//电视剧季ID（没有传0）
  String? eid;//电视剧集ID（没有传0）




  ///视频播放器
  FijkPlayer player = FijkPlayer();
  void playerOption(){
 /*
     1. mediacodec-hevc: 设置使用HEVC（High Efficiency Video Coding）硬件解码器。HEVC是一种视频编码标准，允许更高的视频质量和更低的比特率。
     2.framedrop: 启用帧丢弃，允许在视频渲染过程中丢弃一些帧，以减少延迟。
     3.start-on-prepared: 在调用prepared准备后立即开始播放。
     4.opensles: 禁用OpenSL ES音频渲染器。
     5.mediacodec: 禁用媒体编解码器。
     6.packet-buffering: 禁用数据包缓冲。
     7.mediacodec-auto-rotate: 禁用自动旋转。
     8.mediacodec-handle-resolution-change: 禁用媒体编解码器处理分辨率更改。
     9.min-frames: 设置最小帧数。可能与视频渲染有关。
     10.max_cached_duration: 设置最大缓存持续时间。
     11.infbuf: 启用无限缓冲。
     12.reconnect: 设置重新连接次数。
     13.rtsp_transport: 设置RTSP传输方式为TCP。
     14.http-detect-range-support: 禁用HTTP检测范围支持。
     15.analyzeduration: 设置分析持续时间。
     16.rtsp_flags: 设置RTSP标志为"prefer_tcp"，首选使用TCP传输。
     17.buffer_size: 设置缓冲区大小。
     18.max-fps: 设置最大帧速率。
     19.analyzemaxduration: 设置分析最大持续时间。
     20.dns_cache_clear: 清除DNS缓存。
     21.flush_packets: 启用刷新数据包。
     22.max-buffer-size: 设置最大缓冲区大小。
     23.fflags: 设置文件标志为"nobuffer"。
     24.probesize: 设置探测文件的大小。
     25.skip_loop_filter: 设置跳过环路滤波器。
     26.skip_frame: 设置跳过帧。
     */
    player.setOption(FijkOption.playerCategory, "mediacodec-hevc", 1);
    player.setOption(FijkOption.playerCategory, "framedrop", 1);
    player.setOption(FijkOption.playerCategory, "start-on-prepared", 0);
    player.setOption(FijkOption.playerCategory, "opensles", 0);
    player.setOption(FijkOption.playerCategory, "mediacodec", 0);
    player.setOption(FijkOption.playerCategory, "start-on-prepared", 1);
    player.setOption(FijkOption.playerCategory, "packet-buffering", 0);
    player.setOption(FijkOption.playerCategory, "mediacodec-auto-rotate", 0);
    player.setOption(
        FijkOption.playerCategory, "mediacodec-handle-resolution-change", 0);
    player.setOption(FijkOption.playerCategory, "min-frames", 2);
    player.setOption(FijkOption.playerCategory, "max_cached_duration", 3);
    player.setOption(FijkOption.playerCategory, "infbuf", 1);
    player.setOption(FijkOption.playerCategory, "reconnect", 5);
    player.setOption(FijkOption.playerCategory, "framedrop", 5);

    player.setOption(FijkOption.formatCategory, "rtsp_transport", 'tcp');
    player.setOption(FijkOption.formatCategory, "http-detect-range-support", 0);
    player.setOption(FijkOption.formatCategory, "analyzeduration", 1);
    player.setOption(FijkOption.formatCategory, "rtsp_flags", "prefer_tcp");
    player.setOption(FijkOption.formatCategory, "buffer_size", 1024);
    player.setOption(FijkOption.formatCategory, "max-fps", 0);
    player.setOption(FijkOption.formatCategory, "analyzemaxduration", 50);
    player.setOption(FijkOption.formatCategory, "dns_cache_clear", 1);
    player.setOption(FijkOption.formatCategory, "flush_packets", 1);
    player.setOption(FijkOption.formatCategory, "max-buffer-size", 0);
    player.setOption(FijkOption.formatCategory, "fflags", "nobuffer");
    player.setOption(FijkOption.formatCategory, "probesize", 200);
    player.setOption(FijkOption.formatCategory, "http-detect-range-support", 0);

    player.setOption(FijkOption.codecCategory, "skip_loop_filter", 48);
    player.setOption(FijkOption.codecCategory, "skip_frame", 0);
  }
 
}
 