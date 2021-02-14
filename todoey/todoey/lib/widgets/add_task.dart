import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/constants.dart';

import 'tasks_model.dart';

class AddTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TasksModel myTasksModel = context.watch<TasksModel>();

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
              onChanged: (newValue) {
                myTasksModel.currentText = newValue;
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            FlatButton(
              onPressed: () {
                myTasksModel.addTask();
                Navigator.pop(context);
              },
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
