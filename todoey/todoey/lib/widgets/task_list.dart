import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/widgets/task_tile.dart';

class TaskList extends StatefulWidget {
  final List listOfTasks;

  TaskList({
    @required this.listOfTasks,
  });

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: kCardBorderRadius,
        ),
        child: ListView.builder(
          itemCount: widget.listOfTasks.length,
          itemBuilder: (context, index) {
            return TaskTile(
              isChecked: widget.listOfTasks[index].taskCompletion,
              getCheckboxState: (value) {},
              textToDisplay: widget.listOfTasks[index].taskTitle,
            );
          },
        ),
      ),
    );
  }
}
