import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bellerophone_riverpod/providers/todo_provider.dart'; // Ensure this import is correct

class TodoPage extends ConsumerWidget {
  final TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List Riverpod'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: taskController,
              decoration: InputDecoration(
                labelText: 'Add a new task',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (taskController.text.isNotEmpty) {
                      ref
                          .read(todoProvider.notifier)
                          .addTask(taskController.text);
                      taskController.clear();
                    }
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todos[index].title),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () =>
                        ref.read(todoProvider.notifier).removeTask(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
