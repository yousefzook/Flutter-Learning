import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_list/models/Task.dart';
import 'package:todoey_list/models/tasks_data.dart';
import 'package:todoey_list/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksData>(
      builder: (context, taskData, child) => ListView.builder(
        itemBuilder: (context, index) {
          Task task = taskData.tasks[index];
          return TaskTile(
            name: task.name,
            isChecked: task.isDone,
            onChangedCallback: (isChecked) {
              taskData.checkTask(task, isChecked);
            },
            onLongPressCallback: () {
              taskData.deleteTask(index);
            },
          );
        },
        itemCount: taskData.tasks.length,
      ),
    );
  }
}
