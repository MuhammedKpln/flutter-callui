import 'dart:async';

import 'package:callui/callui.dart';
import 'package:callui/src/components/RoundedButton.dart';
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
    required this.user,
  }) : super();

  /// A custom model that you can use to pass data to the call screen.
  CallUserModel user;

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

  @override
  Widget build(BuildContext context) {
    final formattedDate = formatDate(date);

    return Scaffold(
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
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RoundedButton(
                        press: widget.onPressMic,
                        icon: Icons.mic,
                      ),
                      RoundedButton(
                        press: widget.onPressHangup,
                        color: widget.theme.redColor,
                        iconColor: Colors.white,
                        icon: Icons.phone_paused,
                      ),
                      RoundedButton(
                        press: widget.onPressCamera,
                        icon: Icons.camera,
                      ),
                    ],
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