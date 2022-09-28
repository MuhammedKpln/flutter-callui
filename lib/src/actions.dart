import 'package:flutter/material.dart';
import 'package:flutter_call_ui/flutter_call_ui.dart';
import 'package:flutter_call_ui/src/components/rounded_button.dart';
import 'package:flutter_call_ui/src/theme/base_theme.dart';
import 'package:flutter_call_ui/src/theme/theme.dart';

/// `ActionButtons` is a stateless widget that renders a row of buttons
/// for controlling the call
/// @MuhammedKpln
class ActionButtons extends StatelessWidget {
  // ignore: public_member_api_docs
  const ActionButtons({
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
  final VoidCallback onPressMic;

  /// On Press Camera button
  final VoidCallback onPressCamera;

  /// On Press Hangup button
  final VoidCallback onPressHangup;

  /// A custom widget for rendering action buttons
  final Widget? customWidget;

  /// Theme
  final BaseTheme theme;

  /// Microphone state
  final MicState micState;

  /// Camera state
  final CameraState cameraState;

  Widget _renderConditinally({required Widget child}) {
    if (customWidget != null) {
      return customWidget!;
    }

    return child;
  }

  @override
  Widget build(BuildContext context) {
    return _renderConditinally(
      child: ColoredBox(
        color: theme.backgoundColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                RoundedButton(
                  color: theme.redColor,
                  iconColor: theme.iconColor,
                  icon: Icons.phone_disabled,
                  press: onPressHangup,
                ),
                const Spacer(),
                RoundedButton(
                  color: theme.secondaryColor,
                  iconColor: theme.iconColor,
                  icon: micState.icon,
                  press: onPressMic,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: RoundedButton(
                    color: theme.secondaryColor,
                    iconColor: theme.iconColor,
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
