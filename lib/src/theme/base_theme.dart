// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

abstract class BaseTheme {
  const BaseTheme({
    required this.backgoundColor,
    required this.secondaryColor,
    required this.redColor,
    required this.iconColor,
  });

  final Color backgoundColor;
  final Color secondaryColor;
  final Color redColor;
  final Color iconColor;
}
