import 'package:flutter/material.dart';
import 'package:flutter_call_ui/flutter_call_ui.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class MixedExample extends StatefulWidget {
  MixedExample({Key? key, required this.stream}) : super(key: key);

  MediaStream stream;

  @override
  State<MixedExample> createState() => _MixedExampleState();
}

class _MixedExampleState extends State<MixedExample> {
  CameraState cameraState = CameraState.closed;
  bool fullScreen = false;

  @override
  Widget build(BuildContext context) {
    return CallUI(
      localStream: widget.stream,
      remoteStream: widget.stream,
      cameraState: cameraState,
      fullScreen: fullScreen,
      appBarScaffold: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      onPressContainer: () {
        setState(() {
          fullScreen = !fullScreen;
        });
      },
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
