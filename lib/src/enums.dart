// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

enum CameraState {
  open(Icons.videocam_off),
  closed(Icons.videocam),
  front(Icons.video_camera_front_outlined),
  back(Icons.video_camera_back_outlined);

  const CameraState(this.icon);
  final IconData icon;
}

enum MicState {
  open(Icons.mic),
  closed(Icons.mic_off);

  const MicState(this.icon);
  final IconData icon;
}
