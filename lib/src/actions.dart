import 'package:flutter/material.dart';
import 'package:flutter_call_ui/flutter_call_ui.dart';
import 'package:flutter_call_ui/src/components/RoundedButton.dart';
import 'package:flutter_call_ui/src/theme/base_theme.dart';
import 'package:flutter_call_ui/src/theme/theme.dart';

class ActionButtons extends StatelessWidget {
  ActionButtons({
    super.key,
    required this.onPressCamera,
    required this.onPressHangup,
    required this.onPressMic,
    required this.cameraState,
    required this.micState,
    this.customWidget,
    this.theme = const CallUIDefaultTheme(),
  });

  /// On Press Mic buton
  VoidCallback onPressMic;

  /// On Press Camera button
  VoidCallback onPressCamera;

  /// On Press Hangup button
  VoidCallback onPressHangup;

  /// A custom widget for rendering action buttons
  Widget? customWidget;

  /// Theme
  BaseTheme theme;

  /// Microphone state
  MicState micState;

  /// Camera state
  CameraState cameraState;

  /// Render is a function that
  ///
  /// Args:
  ///   child (Widget): The widget that will be rendered.
  Widget _Render({required Widget child}) {
    if (customWidget != null) {
      return customWidget!;
    }

    return child;
  }

  @override
  Widget build(BuildContext context) {
    return _Render(
      child: ColoredBox(
        color: theme.backgoundColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                RoundedButton(
                  color: theme.redColor,
                  iconColor: Colors.white,
                  icon: Icons.phone_disabled,
                  press: onPressHangup,
                ),
                const Spacer(),
                RoundedButton(
                  color: theme.secondaryColor,
                  iconColor: Colors.white,
                  icon: micState.icon,
                  press: onPressMic,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: RoundedButton(
                    color: theme.secondaryColor,
                    iconColor: Colors.white,
                    icon: cameraState.icon,
                    press: onPressCamera,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
