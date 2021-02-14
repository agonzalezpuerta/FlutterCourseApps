import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/widgets/add_task.dart';
import 'package:todoey/widgets/task_list.dart';
import 'package:todoey/widgets/tasks_model.dart';

int globalInteger = 32;

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TasksModel myTasksModel = context.watch<TasksModel>();

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => SingleChildScrollView(
              child: AddTask(),
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
            ),
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
        ),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(40, 60, 60, 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30,
                    color: Colors.lightBlueAccent,
                  ),
                  radius: 30,
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  'Tapeo',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                  ),
                ),
                Text(
                  '${myTasksModel.getNumberOfTasks()} Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          TaskList(),
        ],
      ),
    );
  }
}
