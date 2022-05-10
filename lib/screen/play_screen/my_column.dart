import 'package:brainer/provider/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      padding: const EdgeInsets.all(5),
      child: Material(
        child: InkWell(
          splashColor: Colors.black,
          child: Center(
            child: Consumer<GameProvider>(builder: (ctx, game, child) {
              String userVal = game.userValues[widget.index].toString();
              if (game.userValues[widget.index] == null) {
                userVal = "";
              }
              return Text(
                game.isPlaying ? userVal : game.values[widget.index].toString(),
                style:
                    const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              );
            }),
          ),
          onTap: Provider.of<GameProvider>(context).isPlaying
              ? () {
                  Provider.of<GameProvider>(context, listen: false)
                      .updateUserValue(widget.index);
                }
              : null,
        ),
      ),
    );
  }
}
