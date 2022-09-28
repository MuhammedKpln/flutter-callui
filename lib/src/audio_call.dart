import 'package:flutter/material.dart';
import 'package:flutter_call_ui/flutter_call_ui.dart';
import 'package:flutter_call_ui/src/actions.dart';
import 'package:flutter_call_ui/src/mixins/Timer.mixin.dart';
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
    super.locale,
  }) : super();

  @override
  State<AudioCall> createState() => _AudioCallState();
}

class _AudioCallState extends State<AudioCall> with TimerMixin<AudioCall> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
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
    return Scaffold(
      appBar: widget.appBarScaffold,
      bottomNavigationBar: _renderBottomNavigationBar(),
      extendBodyBehindAppBar: true,
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
                  renderEstimatedCall((formattedDate) {
                    return Text(
                      '${widget.locale.incomingTxt} $formattedDate'
                          .toUpperCase(),
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
