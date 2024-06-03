part of 'todo_list_cubit.dart';

class TodoListState extends Equatable {
  final List<Todo> todolist;
  const TodoListState({
    required this.todolist,
  });

  factory TodoListState.initial() {
    return const TodoListState(todolist: []);
  }

  @override
  List<Object> get props => [todolist];

  TodoListState copyWith({
    List<Todo>? todolist,
  }) {
    return TodoListState(
      todolist: todolist ?? this.todolist,
    );
  }
}
