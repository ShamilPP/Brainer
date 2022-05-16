import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  final String aboutApp =
      "Brainer is a brain teaser game that has been designed to help people with memory and concentration. The game is designed to work on the brain’s ability to focus and problem solve. The game has been designed to be easy to carry around, so it can be played anywhere. The goal of the game is to find the missing shapes in the grid. The game is designed to help people with memory and concentration.Brainer game a new and exciting game that will challenge the mind and stimulate the brain. Brain-teasers are fun and entertaining, but this game is designed to stimulate the brain, improve memory, and develop reasoning skills. The game consists of a tray with a grid of colored circles and a set of round pieces that fit on the circles. Each player chooses a color and then takes turns placing their pieces on the circles. The object is to place all of your pieces on the board, but you can only place one piece at a time. The person who is able to place all of their pieces on the board first wins. Brainers are great for travel and to keep in your purse or backpack for when you need a quick game break.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                aboutApp,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  "App name : Brainer",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  "App package name : com.shamil.brainer",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  "App version : 2.0",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  "App rating : 5",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Developer : SHAMIL",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
