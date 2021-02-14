import 'package:flutter/foundation.dart';

class Task {
  final String taskText;
  bool taskStatus = false;

  Task(this.taskText);
}

class TasksModel extends ChangeNotifier {
  String currentText;

  List listOfTasks = [];

  void addTask() {
    Task newTask = Task(currentText);

    listOfTasks.add(newTask);

    notifyListeners();
  }

  void deleteTask(int index) {
    listOfTasks.removeAt(index);
    notifyListeners();
  }

  int getNumberOfTasks() => listOfTasks.length;

  String getTaskText(int index) => listOfTasks[index].taskText;

  bool getTaskStatus(int index) => listOfTasks[index].taskStatus;

  void setTaskStatus(int index, bool newValue) {
    listOfTasks[index].taskStatus = newValue;
    notifyListeners();
  }
}
