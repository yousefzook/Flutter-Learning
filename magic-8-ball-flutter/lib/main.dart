import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            title: Center(
              child: Text('Ask Me Anything'),
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
    return Container(
      child: TextButton(
        child: Image.asset('images/ball$random.png'),
        onPressed: changeAnswer(),
      ),
    );
  }

  changeAnswer() {
    print('pressed');
    setState(() {
      random = Random().nextInt(5) + 1;
    });
  }
}
