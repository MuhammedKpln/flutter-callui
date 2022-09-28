import 'package:example/audio_call_example.dart';
import 'package:example/mixed_example.dart';
import 'package:example/video_call_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

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
        home: const MyHomePage(
          title: "CallUI Example",
        ));
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

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AudioCallExample(
                        stream: localStream!,
                      ))),
              child: const Text("Call Example")),
          ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => VideoCallExample(
                        stream: localStream!,
                      ))),
              child: const Text("Video Example")),
          ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MixedExample(
                        stream: localStream!,
                      ))),
              child: const Text("Mixed Example"))
        ],
      ),
    );
  }
}
