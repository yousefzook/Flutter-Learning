import 'package:bmi_calculator/components/rounded_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class NumberChangeWidget extends StatefulWidget {
  int number;
  String label;

  NumberChangeWidget({Key key, this.label, this.number}) : super(key: key);

  @override
  NumberChangeWidgetState createState() => NumberChangeWidgetState();

  int getNumber() => number;
}

class NumberChangeWidgetState extends State<NumberChangeWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.label,
          style: kLabelTextStyle,
        ),
        Text(
          widget.number.toString(),
          style: kSuperTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPressed: () {
                setState(() {
                  widget.number--;
                });
              },
            ),
            SizedBox(width: 10.0),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPressed: () {
                setState(() {
                  widget.number++;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
