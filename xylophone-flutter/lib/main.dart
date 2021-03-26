import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  Expanded createExpandedButton({Color color, int soundNumber}) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
        ),
        onPressed: () {
          final player = AudioCache();
          player.play('note$soundNumber.wav');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              createExpandedButton(color: Colors.red, soundNumber: 1),
              createExpandedButton(color: Colors.orange, soundNumber: 2),
              createExpandedButton(color: Colors.yellow, soundNumber: 3),
              createExpandedButton(color: Colors.green, soundNumber: 4),
              createExpandedButton(color: Colors.teal, soundNumber: 5),
              createExpandedButton(color: Colors.blue, soundNumber: 6),
              createExpandedButton(color: Colors.purple, soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
