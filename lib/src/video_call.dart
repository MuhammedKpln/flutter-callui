import 'package:callui/callui.dart';
import 'package:callui/src/actions.dart';
import 'package:callui/src/call_core.dart';
import 'package:callui/src/renderer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class VideoCall extends CallUI {
  VideoCall({
    required super.remoteStream,
    required super.localStream,
    required super.onPressCamera,
    required super.onPressHangup,
    required super.onPressMic,
    required super.user,
    required super.cameraState,
    required super.micState,
    super.fullScreen,
    super.onPressContainer,
    super.customActionWidget,
    super.appBarScaffold,
    super.theme,
  }) : super();

  @override
  State<VideoCall> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  final RTCVideoRenderer localRenderer = RTCVideoRenderer();
  final RTCVideoRenderer remoteRenderer = RTCVideoRenderer();
  Offset cameraOffset = Offset.zero;
  bool userFull = false;

  double get isFullScreenOpacity {
    if (isFullscreen) {
      return 0;
    }

    return 1;
  }

  bool get isFullscreen {
    if (widget.fullScreen != null) {
      if (widget.fullScreen!) {
        return true;
      }

      return false;
    }

    return false;
  }

  @override
  void initState() {
    super.initState();

    _initRenderer();
  }

  @override
  void dispose() {
    localRenderer.dispose();
    remoteRenderer.dispose();
    super.dispose();
  }

  Future<void> _initRenderer() async {
    await localRenderer.initialize();
    await remoteRenderer.initialize();

    localRenderer.srcObject = widget.localStream;
    remoteRenderer.srcObject = widget.remoteStream;

    setState(() {});
  }

  void _onDragEnd(DraggableDetails details) {
    setState(() {
      cameraOffset = details.offset;
    });
  }

  Widget _renderBottomNavigationBar() {
    return AnimatedCrossFade(
      crossFadeState:
          !isFullscreen ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 100),
      firstChild: ActionButtons(
        onPressCamera: widget.onPressCamera,
        onPressHangup: widget.onPressHangup,
        onPressMic: widget.onPressMic,
        cameraState: widget.cameraState,
        micState: widget.micState,
        theme: widget.theme,
      ),
      secondChild: const SizedBox(),
    );
  }

  PreferredSizeWidget? _renderAppBar() {
    if (widget.appBarScaffold == null) return null;

    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: AnimatedCrossFade(
        crossFadeState: !isFullscreen
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 100),
        firstChild: widget.appBarScaffold!,
        secondChild: const SizedBox(),
      ),
    );
  }

  Widget _renderUserCamera(
    CameraRenderer remoteCamera,
    CameraRenderer localCamera,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          userFull = !userFull;
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          width: 150,
          height: 200,
          child: userFull ? remoteCamera : localCamera,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.cameraState);

    final localCamera = CameraRenderer(
      renderer: localRenderer,
    );

    final remoteCamera = CameraRenderer(
      renderer: remoteRenderer,
      mirror: true,
    );

    final userCameraWidget = _renderUserCamera(remoteCamera, localCamera);

    return Scaffold(
      appBar: _renderAppBar(),
      extendBodyBehindAppBar: true,
      bottomNavigationBar: _renderBottomNavigationBar(),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GestureDetector(
            onTap: () => widget.onPressContainer?.call(),
            child: userFull ? localCamera : remoteCamera,
          ),
          Positioned(
            top: cameraOffset.dy,
            left: cameraOffset.dx,
            child: Draggable(
              childWhenDragging: Container(),
              feedback: Opacity(opacity: .4, child: userCameraWidget),
              onDragEnd: _onDragEnd,
              child: userCameraWidget,
            ),
          ),
        ],
      ),
    );
  }
}
