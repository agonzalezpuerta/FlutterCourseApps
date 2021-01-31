import 'package:flutter/material.dart';

const TextStyle kTaskListTextStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w500,
  color: Colors.black54,
);

const TextStyle kAddTaskTextStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.normal,
  color: Colors.lightBlueAccent,
);

const InputDecoration kAddTaskInputDecoration = InputDecoration(
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.lightBlueAccent,
    ),
  ),
);

const BorderRadius kCardBorderRadius = BorderRadius.only(
  topLeft: Radius.circular(15.0),
  topRight: Radius.circular(15.0),
);
