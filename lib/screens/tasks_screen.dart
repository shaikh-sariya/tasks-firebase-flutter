import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../blocs/tasks_bloc.dart';
import '../models/task.dart';
import '../widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({super.key});

  final TextEditingController titleController = TextEditingController();

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  'Add Task',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    label: Text('Title'),
                    border: OutlineInputBorder(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Tasks App'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              )
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Chip(
                  label: Text(
                    'Tasks:',
                  ),
                ),
              ),
              TasksList(tasksList: tasksList)
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addTask(context),
            tooltip: 'App Task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
