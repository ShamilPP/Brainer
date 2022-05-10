import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/game_provider.dart';

class MyTimer extends StatefulWidget {
  const MyTimer({Key? key}) : super(key: key);

  @override
  State<MyTimer> createState() => _MyTimerState();
}

class _MyTimerState extends State<MyTimer> {
  int _time = 5;
  AudioCache player = AudioCache();
  late Timer timer;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Provider.of<GameProvider>(context).isPlaying
        ? const SizedBox()
        : Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.red),
            child: Center(
                child: Text(
              _time.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            )),
          );
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_time == 0) {
          setState(() {
            timer.cancel();
            player.play("ended.mp3").then((value) {
              player.clearAll();
              Provider.of<GameProvider>(context, listen: false).setPlaying();
            });
          });
        } else {
          setState(() {
            _time--;
            player.play("countdown.mp3");
          });
        }
      },
    );
  }
}
