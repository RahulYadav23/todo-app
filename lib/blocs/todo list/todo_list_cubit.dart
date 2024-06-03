import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/models/todo_model.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState.initial());

  void addTodo(String description) {
    final newtodo = Todo(description: description);
    final newTodoList = [...state.todolist, newtodo];

    emit(state.copyWith(todolist: newTodoList));
  }

  void editTodo(String id, String description) {
    final newTodo = state.todolist.map((td) {
      if (td.id == id) {
        return Todo(id: id, description: description, completed: td.completed);
      }
      return td;
    }).toList();

    emit(state.copyWith(todolist: newTodo));
  }

  void toggleTodo(String id) {
    final newTodo = state.todolist.map((e) {
      if (e.id == id) {
        return Todo(
            description: e.description, completed: !e.completed, id: id);
      }
      return e;
    }).toList();

    emit(state.copyWith(todolist: newTodo));
  }

  void removeTodo(String id) {
    final newTodo =
        state.todolist.where((element) => element.id != id).toList();

    emit(state.copyWith(todolist: newTodo));
  }
}
