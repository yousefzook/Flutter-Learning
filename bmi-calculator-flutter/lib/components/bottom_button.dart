import 'package:flutter/material.dart';

import '../constants.dart';


class BottomButton extends StatelessWidget {
  const BottomButton({
    Key key,
    this.onPressed,
    this.label,
  }) : super(key: key);

  final Function onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Center(
          child: Text(
            label,
            style: kHeadTextStyle,
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
