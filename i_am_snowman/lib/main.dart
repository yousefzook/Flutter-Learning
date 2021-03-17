import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            title: Center(
              child: Text("I am a snowman!"),
            ),
            backgroundColor: Colors.lightBlueAccent,
          ),
          body: Center(
            child: Image(
              image: AssetImage('images/flame-1642.png'),
            ),
          ))));
}
