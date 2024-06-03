import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/blocs/todo%20filter/todo_filter_cubit.dart';
import 'package:todo/blocs/todo%20list/todo_list_cubit.dart';
import 'package:todo/blocs/todo%20search/todo_search_cubit.dart';
import 'package:todo/models/todo_model.dart';

part 'filtered_todos_state.dart';

class FilteredTodosCubit extends Cubit<FilteredTodosState> {
  final TodoListCubit todoListCubit;
  final TodoFilterCubit todoFilterCubit;
  final TodoSearchCubit todoSearchCubit;
  final List<Todo> intialTodo;
  late final StreamSubscription todolistsub;
  late final StreamSubscription todofiltersub;
  late final StreamSubscription todosearchsub;

  FilteredTodosCubit({
    required this.intialTodo,
    required this.todoListCubit,
    required this.todoFilterCubit,
    required this.todoSearchCubit,
  }) : super(FilteredTodosState(filteredtodos: intialTodo)) {
    todofiltersub = todoFilterCubit.stream.listen((event) {
      setFilteredTodo();
    });
    todosearchsub = todoSearchCubit.stream.listen((event) {
      setFilteredTodo();
    });
    todolistsub = todoListCubit.stream.listen((event) {
      setFilteredTodo();
    });
  }

  void setFilteredTodo() {
    List<Todo> filteredTodos;

    switch (todoFilterCubit.state.filter) {
      case Filter.active:
        filteredTodos = todoListCubit.state.todolist
            .where((Todo todo) => !todo.completed)
            .toList();
        break;
      case Filter.completed:
        filteredTodos = todoListCubit.state.todolist
            .where((Todo todo) => todo.completed)
            .toList();
        break;
      case Filter.all:
      default:
        filteredTodos = todoListCubit.state.todolist;
        break;
    }

    if (todoSearchCubit.state.searchTerm.isNotEmpty) {
      filteredTodos = filteredTodos
          .where((Todo todo) => todo.description
              .toLowerCase()
              .contains(todoSearchCubit.state.searchTerm.toLowerCase()))
          .toList();
    }

    emit(state.copyWith(filteredtodos: filteredTodos));
  }
}
