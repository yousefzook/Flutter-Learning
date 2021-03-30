import 'file:///C:/Users/yzook/AndroidStudioProjects/bmi-calculator-flutter/lib/components/reusable_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ResultsPage extends StatelessWidget {
  String resultText;
  String resultNumber;
  String advice;

  ResultsPage({this.resultNumber, this.resultText, this.advice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                color: kActiveReusableCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(resultText.toUpperCase(), style: kResultTextStyle),
                    Text(resultNumber, style: kBMITextStyle),
                    Text(
                      advice,
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              onPressed: () {
                Navigator.pop(context);
              },
              label: 'Recalculate',
            ),
          ],
        ));
  }
}
