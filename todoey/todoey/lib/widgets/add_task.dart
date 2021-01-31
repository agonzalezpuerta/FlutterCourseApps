import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';

class AddTask extends StatelessWidget {
  final Function getTaskText;
  final Function saveTaskText;

  AddTask({
    @required this.getTaskText,
    @required this.saveTaskText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: kCardBorderRadius,
          color: Colors.white,
        ),
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: [
            Text(
              'Add Task',
              style: kAddTaskTextStyle,
            ),
            SizedBox(
              height: 2.0,
            ),
            TextField(
              style: kTaskListTextStyle,
              decoration: kAddTaskInputDecoration,
              textAlign: TextAlign.center,
              onChanged: getTaskText,
            ),
            SizedBox(
              height: 10.0,
            ),
            FlatButton(
              onPressed: saveTaskText,
              padding: EdgeInsets.zero,
              child: Container(
                height: 35.0,
                color: Colors.lightBlueAccent,
                child: Center(
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
