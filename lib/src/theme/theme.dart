// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_call_ui/src/theme/base_theme.dart';

/// It's a class that defines the default theme for the CallUI
/// @MuhammedKpln
@immutable
class CallUIDefaultTheme extends BaseTheme {
  const CallUIDefaultTheme({
    super.backgoundColor = const Color(0xFF091C40),
    super.secondaryColor = const Color(0xFF606060),
    super.redColor = const Color(0xFFFF1E46),
    super.iconColor = Colors.white,
  });
}
