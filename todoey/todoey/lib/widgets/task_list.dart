import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:todoey/widgets/tasks_model.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TasksModel myTasksModel = context.watch<TasksModel>();

    return Expanded(
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: kCardBorderRadius,
        ),
        child: ListView.builder(
          itemCount: myTasksModel.getNumberOfTasks(),
          itemBuilder: (context, index) {
            return Dismissible(
              key: ValueKey(index),
              background: Container(
                color: Colors.grey[400],
              ),
              onDismissed: (direction) {
                myTasksModel.deleteTask(index);
              },
              child: TaskTile(
                isChecked: myTasksModel.getTaskStatus(index),
                getCheckboxState: (value) {
                  myTasksModel.setTaskStatus(index, value);
                },
                textToDisplay: myTasksModel.getTaskText(index),
              ),
            );
          },
        ),
      ),
    );
  }
}
