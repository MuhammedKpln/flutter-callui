import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:callui/callui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MediaStream? localStream;
  MediaStream? remoteStream;
  bool fullscren = false;

  bool init = false;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
    await navigator.mediaDevices.enumerateDevices();
    final stream = await navigator.mediaDevices.getUserMedia({
      "audio": true,
      "video": {
        'facingMode': 'user',
      }
    });

    localStream = stream;
    remoteStream = stream;

    setState(() {
      init = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!init) {
      return const CircularProgressIndicator();
    }

    return CallUI.AudioCall(
      localStream: localStream!,
      remoteStream: remoteStream!,
      fullScreen: fullscren,
      onPressCamera: () => null,
      onPressHangup: () => null,
      onPressMic: () => null,
      user: CallUserModel(
          avatar:
              'https://github.com/abuanwar072/Calling-Interface-Flutter/blob/master/assets/images/full_image.png?raw=true',
          username: 'Muhammed Kaplan'),
      appBarScaffold: AppBar(
        leading: const Icon(Icons.arrow_back),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      onPressContainer: () {
        setState(() {
          fullscren = !fullscren;
        });
      },
    );
  }
}
