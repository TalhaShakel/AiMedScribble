import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../uitilities/colors.dart';
import '../../widgets/text_field_input.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  SpeechToText speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

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
    initSpeechToText();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    audioRecorder.dispose();
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> initTextToSpeech() async {
    setState(() {});
  }

  Future<void> initSpeechToText() async {
    await speechToText.initialize();
    setState(() {});
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

  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }

  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image.asset("assets/side_menu.png"),
        title: const Row(
          children: [
            Text(
              "Your work",
              style: TextStyle(
                color: textColor,
                fontSize: 13,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              "Projects",
              style: TextStyle(
                color: textColor,
                fontSize: 13,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            )
          ],
        ),
        actions: [
          Image.asset("assets/tittle.png"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
              width: screenWidth * 0.35,
              child: TextFieldInput(
                iconPath: "assets/search.png",
                hintText: 'Search',
                textInputType: TextInputType.text,
                textEditingController: _searchController,
                isSearch: true,
              ),
            ),
          ),
          Image.asset("assets/help.png"),
          Image.asset("assets/notification.png"),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 18),
            child: Text(
              "Dr.Jhon",
              style: TextStyle(
                color: textColor,
                fontSize: 13,
              ),
            ),
          ),
          Image.asset("assets/profile.png"),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                  elevation: 20,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                      width: screenWidth * 0.5,
                      height: 450,
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            width: screenWidth,
                            decoration: const BoxDecoration(
                                color: blueColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.02),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset("assets/video.png"),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      const Text(
                                        "Live Stream",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Image.asset("assets/arrow _down.png"),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                              child: Image.asset(
                            "assets/bgImage.png",
                            fit: BoxFit.cover,
                          )),
                          Container(
                            height: 80,
                            width: screenWidth,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            child: const Text(
                              "Live Stream",
                              style: TextStyle(
                                color: text2Color,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ))),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 20,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SizedBox(
                    width: screenWidth * 0.5,
                    height: 200,
                    child: Column(
                      children: [
                        Container(
                          height: 80,
                          width: screenWidth,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.02),
                            child: Row(
                              children: [
                                Image.asset("assets/message.png"),
                                const SizedBox(
                                  width: 20,
                                ),
                                const Text(
                                  "Messenger",
                                  style: TextStyle(
                                    color: text2Color,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Send Doctor a message....",
                              fillColor: Colors.white,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 25,
                              ),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                elevation: 20,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SizedBox(
                  width: screenWidth * 0.5,
                  height: screenHeight,
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: screenWidth,
                        decoration: const BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                      child: Image.asset("assets/voice.png")),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const Text(
                                    "Speech to Text",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              // Column(
                              //   children: [
                                  
                                    GestureDetector(
                                          onTap: isRecording
                                              ? stoptRecording
                                              : startRecording,
                                          child: isRecording
                                              ? Icon(Icons.stop,color: Colors.green.shade600,)
                                              : const Icon(Icons.mic,color: Colors.black,)
                                    ),
                              //   ],
                              // )
                              // GestureDetector(
                              //     onTapDown: (details) async {
                              //       if (await speechToText.hasPermission &&
                              //           speechToText.isNotListening) {
                              //         setState(() {
                              //           _speechEnabled = true;
                              //         });
                              //         startRecording;
                              //       }
                              //     },
                              //     onTapUp: (details) async {
                              //       if (speechToText.isListening) {
                              //         stoptRecording();
                              //       }
                              //     },

                              //     //  },
                              //     child: Icon(
                              //             Icons.mic,
                              //             color: 
                              // speechToText.isListening
                              //                 ? Colors.green
                              //                 : Colors.black,
                              //           )),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                if (!isRecording && audioPath != null)
                                  Image.asset("assets/solar_hambur.png"),
                                const SizedBox(
                                  width: 20,
                                ),
                                Image.asset("assets/replayrounded.png"),
                                const SizedBox(
                                  width: 10,
                                ),
                                IconButton(
                                    onPressed: () async{
                                      if (await speechToText.hasPermission &&
                                        speechToText.isNotListening) {
                                      setState(() {
                                        _speechEnabled = true;
                                      });
                                      // startRecording;
                                      playRecording();
                                    }else {
                                        stopListening();
                                      }
                                  },
                                    
                                    icon: Icon(
                                      Icons.play_arrow,
                                      color: Colors.grey.shade800,
                                    )),
                                // Image.asset("assets/play-arrow-rounded.png"),
                                const SizedBox(
                                  width: 10,
                                ),
                                Image.asset("assets/forwardrounded.png"),
                              ],
                            ),
                            Image.asset("assets/volume-up-fill.png"),
                          ],
                        ),
                      ),
                      Text(
                        speechToText.isListening
                            ? '$_lastWords'
                            // If listening isn't active but could be tell the user
                            // how to start it, otherwise indicate that speech
                            // recognition is not yet ready or not supported on
                            // the target device
                            : _speechEnabled
                                ? 'Tap the microphone to start listening...'
                                : audioPath,
                        style: const TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
