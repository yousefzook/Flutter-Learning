import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            backgroundColor: Colors.indigo,
            title: Center(
              child: Text(
                'Ask Me Anything',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
          body: EightBall(),
        ),
      ),
    );

class EightBall extends StatefulWidget {
  @override
  _EightBallState createState() => _EightBallState();
}

class _EightBallState extends State<EightBall> {
  int random = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Image.asset('images/ball$random.png'),
        onPressed: () {
          changeAnswer();
        },
      ),
    );
  }

  void changeAnswer() {
    setState(() {
      random = Random().nextInt(5) + 1;
    });
  }
}
