import 'package:brainer/provider/game_provider.dart';
import 'package:brainer/screen/about_screen.dart';
import 'package:brainer/screen/play_screen/play_screen.dart';
import 'package:brainer/screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    initSharedPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Brainer"),
      ),
      body: Container(
        color: const Color(0xffffffff),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SizedBox(
                height: 250,
                width: 250,
                child: Image.asset("assets/brainer.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  gameMode(context, "Easy", 2),
                  gameMode(context, "Medium", 3),
                  gameMode(context, "Hard", 4),
                ],
              ),
            ),
            horizontalContainer("Settings", Icons.settings, () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const SettingsScreen()));
            }),
            horizontalContainer("About", Icons.info, () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const AboutScreen()));
            }),
          ],
        ),
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

          Provider.of<GameProvider>(context, listen: false).startGame(false);
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const PlayScreen()));
        },
      ),
    );
  }

  Widget horizontalContainer(
      String text, IconData icon, void Function() onPress) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[300],
        ),
        margin: const EdgeInsets.all(10),
        height: 75,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                icon,
                size: 40,
              ),
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
      onTap: onPress,
    );
  }

  void initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('time')) {
      int? time = prefs.getInt('time');
      Provider.of<GameProvider>(context, listen: false).setTimer(time!);
    } else {
      await prefs.setInt('time', 5);
      Provider.of<GameProvider>(context, listen: false).setTimer(5);
    }
  }
}
