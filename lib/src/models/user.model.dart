library callui;

import 'package:flutter/material.dart';

/// `CallUserModel` is a class that contains a `username` and `avatar` property
/// @MuhammedKpln

@immutable
class CallUserModel {
  // ignore: public_member_api_docs
  const CallUserModel({
    required this.avatar,
    required this.username,
  });

  /// A variable that is used to store the username of the user.
  final String username;

  /// A variable that is used to store the avatar of the user.
  final String avatar;
}
