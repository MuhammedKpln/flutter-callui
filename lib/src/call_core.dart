// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_call_ui/flutter_call_ui.dart';
import 'package:flutter_call_ui/src/audio_call.dart';
import 'package:flutter_call_ui/src/theme/base_theme.dart';
import 'package:flutter_call_ui/src/theme/theme.dart';
import 'package:flutter_call_ui/src/video_call.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

/// It's a stateful widget that switches between
/// the audio and video call UI based on the camera state
/// @MuhammedKpln
// ignore: must_be_immutable
class CallUI extends StatefulWidget {
  // ignore: public_member_api_docs
  CallUI({
    super.key,
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
    this.locale = const CallENLocale(),
  });

  /// A factory constructor that returns a VideoCall widget.
  ///
  /// Args:
  ///   localStream (MediaStream): The local stream of the user.
  ///   remoteStream (MediaStream): The remote stream that is being received from the other user.
  ///   onPressCamera (VoidCallback): This is the callback that is called when the user presses the
  /// camera button.
  ///   onPressHangup (VoidCallback): This is the callback that is called when the user presses the
  /// hangup button.
  ///   onPressMic (VoidCallback): This is a callback that is called when the user presses the mic
  /// button.
  ///   user (CallUserModel): The user model that contains the user's name and avatar.
  ///   fullScreen (bool): If you want to show the video call in full screen mode, set this to true.
  ///   onPressContainer (VoidCallback): This is the callback that is called when the user taps on the
  /// screen.
  ///   customActionWidget (Widget): This is a widget that you can pass to the call screen. It will be
  /// displayed on the top right corner of the screen.
  ///   appBarScaffold (PreferredSizeWidget): This is the app bar that will be displayed on the top of
  /// the screen.
  ///   cameraState (CameraState): The state of the camera. Defaults to CameraState
  ///   micState (MicState): The state of the microphone. Defaults to MicState
  ///   theme (BaseTheme): This is the theme of the call UI. You can use the default theme or create
  /// your own. Defaults to const CallUIDefaultTheme()
  ///   locale (BaseLocale): The locale of the call screen.Defaults to const CallENLocale()
  ///
  /// Returns:
  ///   A VideoCall widget.
  // ignore: non_constant_identifier_names
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
    BaseLocale locale = const CallENLocale(),
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
      locale: locale,
    );
  }

  /// A factory constructor that returns an AudioCall widget.
  ///
  /// Args:
  ///   localStream (MediaStream): The local stream of the user.
  ///   remoteStream (MediaStream): The remote stream that is being received from the other user.
  ///   onPressCamera (VoidCallback): This is the callback that is called when the user presses the
  /// camera button.
  ///   onPressHangup (VoidCallback): This is the callback that is called when the user presses the
  /// hangup button.
  ///   onPressMic (VoidCallback): This is a callback that is called when the user presses the mic
  /// button.
  ///   user (CallUserModel): The user model that contains the user's name and avatar.
  ///   fullScreen (bool): If you want to show the call screen in full screen mode, set this to true.
  ///   onPressContainer (VoidCallback): This is the callback that is called when the user taps on the
  /// screen.
  ///   customActionWidget (Widget): This is a widget that you can pass to the call screen. It will be
  /// displayed on the top right corner of the screen.
  ///   appBarScaffold (PreferredSizeWidget): This is the app bar that will be displayed on the top of
  /// the screen.
  ///   cameraState (CameraState): The state of the camera. Defaults to CameraState
  ///   micState (MicState): The state of the microphone. Defaults to MicState
  ///   theme (BaseTheme): This is the theme of the UI. You can use the default theme or create your
  /// own. Defaults to const CallUIDefaultTheme()
  ///   locale (BaseLocale): The locale of the call screen. Defaults to const CallENLocale()
  ///
  /// Returns:
  ///   A widget.
  // ignore: non_constant_identifier_names
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
    BaseLocale locale = const CallENLocale(),
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
      locale: locale,
    );
  }

  /// A variable that is used to store the remote stream.
  final MediaStream remoteStream;

  /// A variable that is used to store the local stream.
  final MediaStream localStream;

  /// Hides action buttons.
  final bool? fullScreen;

  /// A callback that is called when the user presses the container.
  final VoidCallback? onPressContainer;

  /// A callback that is called when the user presses the mic button.
  final VoidCallback onPressMic;

  /// A callback that is called when the user presses the camera button.
  final VoidCallback onPressCamera;

  /// A callback that is called when the user presses the hangup.
  final VoidCallback onPressHangup;

  /// Custom action widget
  final Widget? customActionWidget;

  /// Custom AppBar for Scaffold
  final PreferredSizeWidget? appBarScaffold;

  /// A default theme for the callui.
  BaseTheme theme = const CallUIDefaultTheme();

  /// A default theme for the callui.
  CameraState cameraState = CameraState.closed;

  /// A default theme for the callui.
  MicState micState = MicState.closed;

  /// A default theme for the callui.
  final CallUserModel user;

  /// App locale
  BaseLocale locale;

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
              locale: widget.locale,
            ),
    );
  }
}
