import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kRoundedTextFieldDecoration = InputDecoration(
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: kEnabledOutlineInputBorder,
  focusedBorder: kFoucsedOutlineInputBorder,
);

const kEnabledOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
  borderRadius: BorderRadius.all(Radius.circular(32.0)),
);

const kFoucsedOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
  borderRadius: BorderRadius.all(Radius.circular(32.0)),
);

const kBorderRadiusRight = BorderRadius.only(
  bottomLeft: Radius.circular(30.0),
  bottomRight: Radius.circular(30.0),
  topLeft: Radius.circular(30.0),
);

const kBorderRadiusLeft = BorderRadius.only(
  bottomLeft: Radius.circular(30.0),
  bottomRight: Radius.circular(30.0),
  topRight: Radius.circular(30.0),
);
