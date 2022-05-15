import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/game_provider.dart';
import '../winner_screen.dart';

class FinishButton extends StatelessWidget {
  const FinishButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider.of<GameProvider>(context).isPlaying
        ? Container(
            width: 170,
            height: 50,
            color: Colors.green,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              onPressed: () {
                Map<int, String> values =
                    Provider.of<GameProvider>(context, listen: false).values;
                Map<int, String> userValues =
                    Provider.of<GameProvider>(context, listen: false)
                        .userValues;
                if (mapEquals(values, userValues)) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const WinnerScreen()));
                } else {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Wrong'),
                      content: const Text("Your entered values inccorect"),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Retry'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text(
                "Check", // not prefect
                style: TextStyle(fontSize: 30),
              ),
            ),
          )
        : const SizedBox();
  }
}
