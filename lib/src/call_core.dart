import 'package:callui/callui.dart';
import 'package:callui/src/audio_call.dart';
import 'package:callui/src/theme/base_theme.dart';
import 'package:callui/src/theme/theme.dart';
import 'package:callui/src/video_call.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class CallUI extends StatefulWidget {
  CallUI({
    required this.remoteStream,
    required this.localStream,
    required this.onPressCamera,
    required this.onPressHangup,
    required this.onPressMic,
    this.fullScreen,
    this.onPressContainer,
    this.customActionWidget,
    this.appBarScaffold,
    this.theme = const CallUIDefaultTheme(),
  });

  factory CallUI.VideoCall({
    required MediaStream localStream,
    required MediaStream remoteStream,
    required VoidCallback onPressCamera,
    required VoidCallback onPressHangup,
    required VoidCallback onPressMic,
    bool? fullScreen,
    VoidCallback? onPressContainer,
    Widget? customActionWidget,
    PreferredSizeWidget? appBarScaffold,
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

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }

  @override
  State<CallUI> createState() => _CallUIState();
}

class _CallUIState extends State<CallUI> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
