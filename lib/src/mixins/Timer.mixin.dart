import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_call_ui/src/state/timer.state.dart';
import 'package:flutter_call_ui/src/utils.dart';

/// A mixin for calculating estimating call duration.
mixin TimerMixin<T extends StatefulWidget> on State<T> {
  late Timer _timer;

  /// Creating a stream controller that will broadcast the date to all listeners
  final StreamController<DateTime> _timerStream = StreamController.broadcast();

  /// This function starts a timer for estimating call duration.
  void _startTimer() {
    const duration = Duration(seconds: 1);

    _timer = Timer.periodic(duration, (_) {
      estimatedCallDate = estimatedCallDate.add(duration);
      _timerStream.sink.add(estimatedCallDate);
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    _timerStream.close();
    super.dispose();
  }

  /// It returns a widget that displays the estimated call time
  Widget renderEstimatedCall(Widget Function(String) callback) {
    return StreamBuilder<DateTime>(
      stream: _timerStream.stream,
      initialData: estimatedCallDate,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
            final formattedDate = formatDate(estimatedCallDate);
            return callback.call(formattedDate);
          case ConnectionState.none:
            return callback.call('');
          case ConnectionState.waiting:
            return callback.call('');
          case ConnectionState.done:
            return callback.call('');
        }
      },
    );
  }
}
