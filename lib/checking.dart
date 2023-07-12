import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class CheckRecord extends StatefulWidget {
  const CheckRecord({super.key});

  @override
  State<CheckRecord> createState() => _CheckRecordState();
}

class _CheckRecordState extends State<CheckRecord> {
  late Record audioRecorder;
  late AudioPlayer audioPlayer;
  bool isRecording = false;
  String audioPath = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer = AudioPlayer();
    audioRecorder = Record();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    audioRecorder.dispose();
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> startRecording() async {
    try {
      if (await audioRecorder.hasPermission()) {
        await audioRecorder.start();
        setState(() {
          isRecording = true;
        });
      }
    } catch (e) {
      print('Error Start:  $e');
    }
  }

  Future<void> stoptRecording() async {
    try {
      String? path = await audioRecorder.stop();
      setState(() {
        isRecording = false;
        audioPath = path!;
      });
    } catch (e) {
      print('Error Stopping:  $e');
    }
  }

  Future<void> playRecording() async {
    try {
      Source urlSource = UrlSource(audioPath);
      await audioPlayer.play(urlSource);
    } catch (e) {
      print('Error Playing Recording: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.teal.shade100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isRecording)
              Text(
                'Recording in Progress',
                style:
                    TextStyle(fontSize: 20, color: Colors.deepOrange.shade200),
              ),
            ElevatedButton(
                onPressed: isRecording ? stoptRecording : startRecording,
                child: isRecording
                    ? const Text('Stop Recording')
                    : const Text('Start Recording')),
            const SizedBox(
              height: 24,
            ),
            if (!isRecording && audioPath != null)
              ElevatedButton(
                  onPressed: playRecording,
                  child: const Text('Play Recording')),
          ],
        ),
      ),
    ));
  }
}
