import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/blocs/tasks_bloc/bloc_exports.dart';
import 'package:flutter_tasks_app/blocs/tasks_bloc/tasks_bloc.dart';

import '../models/task.dart';
import 'task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.tasksList,
  });

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    /// Complete kaise hoga?
    /// yeh work nhi krrhaa
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: tasksList
              .map((task) => ExpansionPanelRadio(
                  value: task.id,
                  headerBuilder: (context, isOpen) => TaskTile(task: task),
                  body: ListTile(
                    title: SelectableText.rich(TextSpan(children: [
                      const TextSpan(
                        text: 'Title\n',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: task.title),
                      const TextSpan(
                        text: '\n\nDescription\n',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: task.description),
                    ])),
                  )))
              .toList(),
        ),
      ),
    );
  }
}

// Expanded(
// child: ListView.builder(
// itemCount: tasksList.length,
// itemBuilder: (context, index) {
// var task = tasksList[index];
// return TaskTile(task: task);
// }),
// );
