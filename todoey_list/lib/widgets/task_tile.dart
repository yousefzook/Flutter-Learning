import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  void checkTask(bool isChecked) {
    setState(() {
      this.isChecked = isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'this is a task.',
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: TaskCheckbox(
        isChecked: isChecked,
        onChangedCallback: checkTask,
      ),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  final bool isChecked;
  final Function onChangedCallback;

  const TaskCheckbox({this.isChecked, this.onChangedCallback});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: onChangedCallback,
    );
  }
}
