import '../blocs/tasks_bloc/bloc_exports.dart';
import '../models/task.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
  });

  final Task task;

  void _removedOrDeleteTask(BuildContext ctx, Task task) {
    task.isDeleted
        ? ctx.read<TasksBloc>().add(DeleteTask(task: task))
        : ctx.read<TasksBloc>().add(RemovedTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
            decoration: task.isDone! ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: task.isDone,
        onChanged: task.isDeleted == false
            ? (value) {
                context.read<TasksBloc>().add(UpdateTask(task: task));
              }
            : null,
      ),
      onLongPress: () => _removedOrDeleteTask(context, task),
    );
  }
}
