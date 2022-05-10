import 'dart:math';

import 'package:flutter/material.dart';

class GameProvider with ChangeNotifier {
  int userCount = 0;
  bool isPlaying = false;
  int difficulty = 2;

  Map<int, String> values = {};

  Map<int, String> userValues = {};

  void updateUserValue(int column) {
    if (userValues[column] == "" || userValues[column] == null) {
      userCount++;
      userValues[column] = userCount.toString();
    } else if (userValues[column] == userCount.toString()) {
      userCount--;
      userValues[column] = "";
    }
    notifyListeners();
  }

  void setPlaying() {
    isPlaying = true;
    notifyListeners();
  }

  void setDifficulty(int value) {
    difficulty = value;
  }

  void startGame() {
    // set random values
    values.clear();

    List<int> numberList = [];
    Random random = Random();
    do {
      int randomNumber = random.nextInt((difficulty * difficulty) + 1);
      if (!numberList.contains(randomNumber)) {
        if (randomNumber != 0) {
          numberList.add(randomNumber);
          values[numberList.length] = randomNumber.toString();
        }
      }
    } while (numberList.length != difficulty * difficulty);
    // user default values

    userValues.clear();

    isPlaying = false;
    userCount = 0;
  }
}
