import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bellerophone_riverpod/models/todo.dart'; // Ensure this import is correct

class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier() : super([]);

  void addTask(String title) {
    state = [...state, Todo(title: title)];
  }

  void removeTask(int index) {
    state = List.from(state)..removeAt(index);
  }

  void toggleTaskStatus(int index) {
    final updatedTodo = state[index].copyWith(isDone: !state[index].isDone);
    state = [...state]..[index] = updatedTodo;
  }
}

final todoProvider = StateNotifierProvider<TodoNotifier, List<Todo>>((ref) {
  return TodoNotifier();
});
