import 'package:flutter/material.dart';
import 'package:flutter_call_ui/flutter_call_ui.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class AudioCallExample extends StatelessWidget {
  AudioCallExample({Key? key, required this.stream}) : super(key: key);

  MediaStream stream;

  @override
  Widget build(BuildContext context) {
    return CallUI.AudioCall(
      localStream: stream,
      remoteStream: stream,
      fullScreen: false,
      onPressCamera: () => null,
      onPressHangup: () => null,
      onPressMic: () => null,
      user: CallUserModel(
          avatar:
              'https://github.com/abuanwar072/Calling-Interface-Flutter/blob/master/assets/images/full_image.png?raw=true',
          username: 'Muhammed Kaplan'),
      appBarScaffold: AppBar(
        leading: const Icon(Icons.arrow_back),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
