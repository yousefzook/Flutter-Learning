import 'dart:collection';

import 'package:flutter/foundation.dart';

import 'Task.dart';

class TasksData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'buy a'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get tasksCount {
    return _tasks.length;
  }

  void addTask(String taskText) {
    _tasks.add(Task(name: taskText));
    notifyListeners();
  }

  void checkTask(Task task, isChecked) {
    task.isDone = isChecked;
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
