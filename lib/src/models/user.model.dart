library callui;

import 'package:flutter/material.dart';

@immutable
class CallUserModel {
  CallUserModel({
    required this.avatar,
    required this.username,
  });

  String username;
  String avatar;
}
