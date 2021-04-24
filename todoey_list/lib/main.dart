import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_list/models/tasks_data.dart';
import 'package:todoey_list/screens/tasks_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TasksData(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
