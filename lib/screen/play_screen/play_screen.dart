import 'package:brainer/screen/play_screen/check_button.dart';
import 'package:brainer/screen/play_screen/table.dart';
import 'package:brainer/screen/play_screen/timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/game_provider.dart';

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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              gameButton(
                icon: const Icon(
                  Icons.restart_alt,
                  color: Colors.white,
                  size: 30,
                ),
                backgroundColor: Colors.orange,
                onTap: () {
                  Provider.of<GameProvider>(context, listen: false)
                      .startGame(true);
                },
              ),
              gameButton(
                icon: const Icon(
                  Icons.lightbulb,
                  color: Colors.yellow,
                  size: 30,
                ),
                backgroundColor: Colors.black,
                onTap: () {
                  Provider.of<GameProvider>(context, listen: false)
                      .setHint(true);
                  Provider.of<GameProvider>(context, listen: false)
                      .setPlaying(false);
                },
              ),
            ],
          ),
          Provider.of<GameProvider>(context).isPlaying ||
                  Provider.of<GameProvider>(context).isShowHint
              ? const SizedBox()
              : const MyTimer(),
          const DifficultySquare(),
          const FinishButton(),
        ],
      ),
    );
  }

  Widget gameButton({
    required Widget icon,
    required Color backgroundColor,
    required void Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ClipOval(
        child: Material(
          color: backgroundColor, // Button color
          child: InkWell(
            splashColor: Colors.white, // Splash color
            onTap: onTap,
            child: SizedBox(width: 45, height: 45, child: icon),
          ),
        ),
      ),
    );
  }
}
