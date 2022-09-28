import 'package:flutter/material.dart';

/// Base class for locale
/// @MuhammedKpln
@immutable
abstract class BaseLocale {
  const BaseLocale({
    required this.incomingTxt,
  });

  /// Incoming text
  final String incomingTxt;
}

/// Turkish locale for call ui
/// @MuhammedKpln
@immutable
class CallTRLocale extends BaseLocale {
  const CallTRLocale({super.incomingTxt = 'Gelen arama'});
}

/// English locale for call ui
/// @MuhammedKpln
@immutable
class CallENLocale extends BaseLocale {
  const CallENLocale({super.incomingTxt = 'Incoming'});
}
