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
    return Expanded(
      child: ListView.builder(
          itemCount: tasksList.length,
          itemBuilder: (context, index) {
            var task = tasksList[index];
            return TaskTile(task: task);
          }),
    );
  }
}
