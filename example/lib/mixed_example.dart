import 'package:flutter/material.dart';
import 'package:flutter_call_ui/callui.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class MixedExample extends StatefulWidget {
  MixedExample({Key? key, required this.stream}) : super(key: key);

  MediaStream stream;

  @override
  State<MixedExample> createState() => _MixedExampleState();
}

class _MixedExampleState extends State<MixedExample> {
  CameraState cameraState = CameraState.closed;

  @override
  Widget build(BuildContext context) {
    return CallUI(
      localStream: widget.stream,
      remoteStream: widget.stream,
      cameraState: cameraState,
      appBarScaffold: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      user: CallUserModel(
          avatar:
              'https://github.com/abuanwar072/Calling-Interface-Flutter/blob/master/assets/images/full_image.png?raw=true',
          username: 'Muhammed Kaplan'),
      onPressCamera: () {
        setState(() {
          cameraState = cameraState != CameraState.open
              ? CameraState.open
              : CameraState.closed;
        });
      },
      onPressHangup: () => null,
      onPressMic: () => null,
    );
  }
}
