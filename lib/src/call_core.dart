import 'package:flutter/material.dart';
import 'package:flutter_call_ui/callui.dart';
import 'package:flutter_call_ui/src/audio_call.dart';
import 'package:flutter_call_ui/src/theme/base_theme.dart';
import 'package:flutter_call_ui/src/theme/theme.dart';
import 'package:flutter_call_ui/src/video_call.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class CallUI extends StatefulWidget {
  CallUI({
    required this.remoteStream,
    required this.localStream,
    required this.onPressCamera,
    required this.onPressHangup,
    required this.onPressMic,
    required this.user,
    this.fullScreen,
    this.onPressContainer,
    this.customActionWidget,
    this.appBarScaffold,
    this.theme = const CallUIDefaultTheme(),
    this.cameraState = CameraState.closed,
    this.micState = MicState.open,
  });

  factory CallUI.VideoCall({
    required MediaStream localStream,
    required MediaStream remoteStream,
    required VoidCallback onPressCamera,
    required VoidCallback onPressHangup,
    required VoidCallback onPressMic,
    required CallUserModel user,
    bool? fullScreen,
    VoidCallback? onPressContainer,
    Widget? customActionWidget,
    PreferredSizeWidget? appBarScaffold,
    CameraState cameraState = CameraState.closed,
    MicState micState = MicState.closed,
    BaseTheme theme = const CallUIDefaultTheme(),
  }) {
    return VideoCall(
      remoteStream: remoteStream,
      localStream: localStream,
      onPressCamera: onPressCamera,
      onPressHangup: onPressHangup,
      onPressMic: onPressMic,
      appBarScaffold: appBarScaffold,
      customActionWidget: customActionWidget,
      fullScreen: fullScreen,
      onPressContainer: onPressContainer,
      theme: theme,
      user: user,
      cameraState: cameraState,
      micState: micState,
    );
  }

  factory CallUI.AudioCall({
    required MediaStream localStream,
    required MediaStream remoteStream,
    required VoidCallback onPressCamera,
    required VoidCallback onPressHangup,
    required VoidCallback onPressMic,
    required CallUserModel user,
    bool? fullScreen,
    VoidCallback? onPressContainer,
    Widget? customActionWidget,
    PreferredSizeWidget? appBarScaffold,
    CameraState cameraState = CameraState.closed,
    MicState micState = MicState.closed,
    BaseTheme theme = const CallUIDefaultTheme(),
  }) {
    return AudioCall(
      remoteStream: remoteStream,
      localStream: localStream,
      onPressCamera: onPressCamera,
      onPressHangup: onPressHangup,
      onPressMic: onPressMic,
      appBarScaffold: appBarScaffold,
      customActionWidget: customActionWidget,
      fullScreen: fullScreen,
      onPressContainer: onPressContainer,
      theme: theme,
      user: user,
      cameraState: cameraState,
      micState: micState,
    );
  }

  /// A variable that is used to store the remote stream.
  MediaStream remoteStream;

  /// A variable that is used to store the local stream.
  MediaStream localStream;

  /// Hides action buttons.
  bool? fullScreen;

  /// A callback that is called when the user presses the container.
  VoidCallback? onPressContainer;

  /// A callback that is called when the user presses the mic button.
  VoidCallback onPressMic;

  /// A callback that is called when the user presses the camera button.
  VoidCallback onPressCamera;

  /// A callback that is called when the user presses the hangup.
  VoidCallback onPressHangup;

  /// Custom action widget
  Widget? customActionWidget;

  /// Custom AppBar for Scaffold
  PreferredSizeWidget? appBarScaffold;

  /// A default theme for the callui.
  BaseTheme theme = const CallUIDefaultTheme();

  /// A default theme for the callui.
  CameraState cameraState = CameraState.closed;

  /// A default theme for the callui.
  MicState micState = MicState.closed;

  /// A default theme for the callui.
  CallUserModel user;

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }

  @override
  State<CallUI> createState() => _CallUIState();
}

class _CallUIState extends State<CallUI> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool get isCameraOpened =>
      widget.cameraState == CameraState.open ||
      widget.cameraState == CameraState.front ||
      widget.cameraState == CameraState.back;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: isCameraOpened
          ? VideoCall(
              appBarScaffold: widget.appBarScaffold,
              customActionWidget: widget.customActionWidget,
              fullScreen: widget.fullScreen,
              onPressContainer: widget.onPressContainer,
              theme: widget.theme,
              remoteStream: widget.remoteStream,
              localStream: widget.localStream,
              onPressCamera: widget.onPressCamera,
              onPressHangup: widget.onPressHangup,
              onPressMic: widget.onPressMic,
              user: widget.user,
              cameraState: widget.cameraState,
              micState: widget.micState,
            )
          : AudioCall(
              appBarScaffold: widget.appBarScaffold,
              customActionWidget: widget.customActionWidget,
              fullScreen: widget.fullScreen,
              onPressContainer: widget.onPressContainer,
              theme: widget.theme,
              remoteStream: widget.remoteStream,
              localStream: widget.localStream,
              onPressCamera: widget.onPressCamera,
              onPressHangup: widget.onPressHangup,
              onPressMic: widget.onPressMic,
              user: widget.user,
              cameraState: widget.cameraState,
              micState: widget.micState,
            ),
    );
  }
}
