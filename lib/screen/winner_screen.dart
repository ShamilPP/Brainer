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
                        .startGame();
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
}
