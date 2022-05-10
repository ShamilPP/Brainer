import 'package:brainer/provider/game_provider.dart';
import 'package:brainer/screen/play_screen/play_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Brainer"),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 250,
              width: 250,
              child: Image.asset("assets/brainer.png"),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                gameMode(context, "Easy", 2),
                gameMode(context, "Medium", 3),
                gameMode(context, "Hard", 4),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget gameMode(BuildContext context, String mode, int difficulty) {
    return Container(
      width: 100,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 4),
      ),
      child: InkWell(
        child: Center(
            child: Text(
          mode,
          style: const TextStyle(fontSize: 18),
        )),
        splashColor: Colors.black,
        onTap: () {
          Provider.of<GameProvider>(context, listen: false)
              .setDifficulty(difficulty);

          Provider.of<GameProvider>(context, listen: false).startGame();
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const PlayScreen()));
        },
      ),
    );
  }
}
