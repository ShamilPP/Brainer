import 'package:brainer/screen/play_screen/play_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/game_provider.dart';

class WinnerScreen extends StatelessWidget {
  const WinnerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xff1e040e),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset("assets/congratulations.jpg"),
            gameModeText(context),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.green,
              ),
              width: 175,
              height: 50,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.white,
                  child: const Center(
                    child: Text(
                      "BACK TO HOME",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  onTap: () {
                    Provider.of<GameProvider>(context, listen: false)
                        .startGame(false);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => const PlayScreen()));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget gameModeText(BuildContext context) {
    String gameMode = "";
    int difficulty = Provider.of<GameProvider>(context).difficulty;
    if (difficulty == 2) {
      gameMode = "Easy (2X2)";
    } else if (difficulty == 3) {
      gameMode = "Medium (3X3)";
    } else {
      gameMode = "Hard (4X4)";
    }
    return Text(
      gameMode,
      style: const TextStyle(color: Colors.white, fontSize: 20),
    );
  }
}
