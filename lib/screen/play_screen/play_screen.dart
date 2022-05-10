import 'package:brainer/screen/play_screen/finish_button.dart';
import 'package:brainer/screen/play_screen/table.dart';
import 'package:brainer/screen/play_screen/timer.dart';
import 'package:flutter/material.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({Key? key}) : super(key: key);

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Brainer"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          MyTimer(),
          DifficultySquare(),
          FinishButton(),
        ],
      ),
    );
  }
}
