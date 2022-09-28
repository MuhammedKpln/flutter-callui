import 'dart:async';

import 'package:callui/callui.dart';
import 'package:callui/src/actions.dart';
import 'package:callui/src/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

class AudioCall extends CallUI {
  AudioCall({
    required super.remoteStream,
    required super.localStream,
    required super.onPressCamera,
    required super.onPressHangup,
    required super.onPressMic,
    required super.appBarScaffold,
    required super.customActionWidget,
    required super.fullScreen,
    required super.onPressContainer,
    required super.theme,
    required super.user,
    required super.cameraState,
    required super.micState,
  }) : super();

  @override
  State<AudioCall> createState() => _AudioCallState();
}

class _AudioCallState extends State<AudioCall> {
  DateTime date = DateTime(DateTime.now().year, 0, 0);
  late Timer timer;

  @override
  void initState() {
    super.initState();
    print('object');
    _startTimer();
    initializeDateFormatting();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    const duration = Duration(seconds: 1);

    timer = Timer.periodic(duration, (_) {
      setState(() {
        date = date.add(duration);
      });
    });
  }

  Widget _renderBottomNavigationBar() {
    return ActionButtons(
      onPressCamera: widget.onPressCamera,
      onPressHangup: widget.onPressHangup,
      onPressMic: widget.onPressMic,
      cameraState: widget.cameraState,
      micState: widget.micState,
      theme: widget.theme,
    );
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = formatDate(date);

    return Scaffold(
      bottomNavigationBar: _renderBottomNavigationBar(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            widget.user.avatar,
            fit: BoxFit.cover,
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.user.username,
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        ?.copyWith(color: Colors.white),
                  ),
                  Text(
                    'Incoming $formattedDate'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
