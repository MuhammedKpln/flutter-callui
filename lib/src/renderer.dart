import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

/// `CameraRenderer` is a `StatelessWidget` that renders a `RTCVideoView`
///  with the given `RTCVideoRenderer` and optional parameters
class CameraRenderer extends StatelessWidget {
  // ignore: public_member_api_docs
  const CameraRenderer({
    super.key,
    required this.renderer,
    this.filterQuality,
    this.mirror,
    this.objectFit,
  });

  /// Renderer
  final RTCVideoRenderer renderer;

  /// Fitting camera
  final RTCVideoViewObjectFit? objectFit;

  /// Mirror effect
  final bool? mirror;

  /// Quality of renderer
  final FilterQuality? filterQuality;

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
