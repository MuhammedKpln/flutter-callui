import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class CameraRenderer extends StatelessWidget {
  CameraRenderer({
    super.key,
    required this.renderer,
    this.filterQuality,
    this.mirror,
    this.objectFit,
  });

  /// Renderer
  RTCVideoRenderer renderer;

  /// Fitting camera
  RTCVideoViewObjectFit? objectFit;

  /// Mirror effect
  bool? mirror;

  /// Quality of renderer
  FilterQuality? filterQuality;

  @override
  Widget build(BuildContext context) {
    return RTCVideoView(
      renderer,
      objectFit: objectFit ?? RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
      filterQuality: filterQuality ?? FilterQuality.low,
      mirror: mirror ?? false,
    );
  }
}
