import 'package:brainer/provider/game_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../winner_screen.dart';

class MyColumn extends StatefulWidget {
  final int index;

  const MyColumn({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<MyColumn> createState() => _MyColumnState();
}

class _MyColumnState extends State<MyColumn> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
          (7 - Provider.of<GameProvider>(context, listen: false).difficulty)
              .toDouble()),
      child: Consumer<GameProvider>(builder: (ctx, game, child) {
        String userVal = game.userValues[widget.index].toString();
        String val = game.values[widget.index].toString();
        bool correct = false;

        if (game.userValues[widget.index] == null) {
          userVal = "";
        }

        if (userVal == val) {
          correct = true;
        }

        return Material(
          color: game.isShowHint
              ? correct
                  ? Colors.green
                  : Colors.red
              : Colors.white,
          child: InkWell(
            splashColor: Colors.black,
            child: Center(
              child: Text(
                game.isPlaying ? userVal : game.values[widget.index].toString(),
                style:
                    const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
            onTap: game.isPlaying
                ? () {
                    game.updateUserValue(widget.index);
                    if (game.difficulty * game.difficulty == game.userCount) {
                      if (mapEquals(game.values, game.userValues)) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const WinnerScreen()));
                      } else {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text('Wrong'),
                            content:
                                const Text("Your entered values inccorect"),
                            actions: <Widget>[
                              ElevatedButton(
                                child: const Text('Retry'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      }
                    }
                  }
                : null,
          ),
        );
      }),
    );
  }
}
