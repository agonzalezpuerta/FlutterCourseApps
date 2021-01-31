import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/widgets/add_task.dart';
import 'package:todoey/widgets/task.dart';
import 'package:todoey/widgets/task_list.dart';

int globalInteger = 32;

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  String taskText;
  List<Task> listOfTasks = [];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {},
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => SingleChildScrollView(
                child: AddTask(
                  getTaskText: (value) {
                    taskText = value;
                  },
                  saveTaskText: () {
                    if (taskText != null) {
                      listOfTasks.add(
                          Task(taskTitle: taskText, taskCompletion: false));
                      taskText = null;
                    }

                    Navigator.pop(context);
                    setState(() {});
                  },
                ),
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
                    'Todoey',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0,
                    ),
                  ),
                  Text(
                    '12 Tasks',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            TaskList(
              listOfTasks: listOfTasks,
            ),
          ],
        ),
      ),
    );
  }
}
