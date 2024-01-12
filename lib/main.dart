import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/blocs/tasks_bloc.dart';
import 'package:flutter_tasks_app/screens/tasks_screen.dart';

import 'blocs/bloc_exports.dart';
import 'models/task.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc()
        ..add(AddTask(
          task: Task(
            title: 'Task1',
            isDone: false,
            isDeleted: false,
          ),
        )),
      child: MaterialApp(
        title: 'Flutter Tasks App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: TasksScreen(),
      ),
    );
  }
}
