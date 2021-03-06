import 'dart:math';

import 'package:flutter/cupertino.dart';

class Calculator {
  final int height;
  final int weight;

  double _bmi;

  Calculator({@required this.height, @required this.weight});

  String getBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 25)
      return 'Overweight';
    else if (_bmi > 18.5)
      return 'Normal';
    else
      return 'Underweight';
  }

  String getDescription() {
    if (_bmi > 25)
      return 'You have more than a normal body weight, try to exercise more.';
    else if (_bmi > 18.5)
      return 'You have a normal body weight, Good Job!';
    else
      return 'You have lower than a normal body weight. You can eat a bit more';
  }
}
