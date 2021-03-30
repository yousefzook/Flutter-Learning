import 'package:bmi_calculator/rounded_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';

class NumberChangeWidget extends StatefulWidget {
  final String label;
  final int initialValue;

  const NumberChangeWidget({Key key, this.label, this.initialValue})
      : super(key: key);

  @override
  _NumberChangeWidgetState createState() =>
      _NumberChangeWidgetState(label, initialValue);
}

class _NumberChangeWidgetState extends State<NumberChangeWidget> {
  int weight;
  String label;

  _NumberChangeWidgetState(String label, int initialValue) {
    this.weight = initialValue;
    this.label = label;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: kLabelTextStyle,
        ),
        Text(
          weight.toString(),
          style: kSuperTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPressed: () {
                setState(() {
                  weight--;
                });
              },
            ),
            SizedBox(width: 10.0),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPressed: () {
                setState(() {
                  weight++;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
