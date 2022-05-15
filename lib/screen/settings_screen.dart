import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/game_provider.dart';
import 'about_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        body: Column(
          children: [
            ListTile(
              title: const Text("Timer"),
              subtitle: const Text("Change game timer"),
              onTap: () => timePickerDialog(context),
            ),
            ListTile(
              title: const Text("Theme"),
              subtitle: const Text("Change theme"),
              onTap: () => unavailableDialog(context),
            ),
            ListTile(
              title: const Text("About"),
              subtitle: const Text("About this app"),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const AboutScreen())),
            )
          ],
        ));
  }

  void unavailableDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Currently unavailable"),
        content: const Text("Will be in the next update"),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Back"))
        ],
      ),
    );
  }

  void timePickerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Timer"),
        content: const TimePicker(),
        actions: [
          ElevatedButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setInt('time',
                    Provider.of<GameProvider>(context, listen: false).timer);
                Navigator.pop(context);
              },
              child: const Text("Save"))
        ],
      ),
    );
  }
}

class TimePicker extends StatefulWidget {
  const TimePicker({Key? key}) : super(key: key);

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  @override
  Widget build(BuildContext context) {
    return NumberPicker(
        value: Provider.of<GameProvider>(context, listen: false).timer,
        minValue: 1,
        maxValue: 60,
        onChanged: (value) => setState(
              () => Provider.of<GameProvider>(context, listen: false)
                  .setTimer(value),
            ));
  }
}
