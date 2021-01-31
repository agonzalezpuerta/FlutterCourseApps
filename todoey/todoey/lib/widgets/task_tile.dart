import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';

class TaskTile extends StatelessWidget {
  final String textToDisplay;
  final bool isChecked;
  final Function getCheckboxState;

  TaskTile(
      {@required this.isChecked,
      @required this.getCheckboxState,
      @required this.textToDisplay});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        textToDisplay,
        style: kTaskListTextStyle,
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: getCheckboxState,
      ),
    );
  }
}
