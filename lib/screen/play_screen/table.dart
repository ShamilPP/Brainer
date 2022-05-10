import 'package:brainer/provider/game_provider.dart';
import 'package:brainer/screen/play_screen/my_column.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DifficultySquare extends StatefulWidget {
  const DifficultySquare({Key? key}) : super(key: key);

  @override
  State<DifficultySquare> createState() => _DifficultySquareState();
}

class _DifficultySquareState extends State<DifficultySquare> {
  @override
  Widget build(BuildContext context) {
    int difficulty =
        Provider.of<GameProvider>(context, listen: false).difficulty;
    return Center(
      child: Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.width - 50,
        width: MediaQuery.of(context).size.width - 50,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: difficulty,
            children: List.generate(difficulty * difficulty, (index) {
              return MyColumn(index: index + 1);
            }),
          ),
        ),
      ),
    );
  }
}
