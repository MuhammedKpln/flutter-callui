import 'package:callui/src/components/RoundedButton.dart';
import 'package:callui/src/theme/base_theme.dart';
import 'package:callui/src/theme/theme.dart';
import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  ActionButtons({
    super.key,
    required this.onPressCamera,
    required this.onPressHangup,
    required this.onPressMic,
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
                  icon: Icons.close,
                  press: onPressHangup,
                ),
                const Spacer(),
                RoundedButton(
                  color: theme.secondaryColor,
                  iconColor: Colors.white,
                  icon: Icons.mic,
                  press: onPressMic,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: RoundedButton(
                    color: theme.secondaryColor,
                    iconColor: Colors.white,
                    icon: Icons.videocam_off,
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
