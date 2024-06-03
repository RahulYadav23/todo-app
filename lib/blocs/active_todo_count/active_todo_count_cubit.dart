import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/blocs/todo%20list/todo_list_cubit.dart';

part 'active_todo_count_state.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  late final StreamSubscription todolistsub;
  final TodoListCubit todoListCubit;
  int activecount;
  ActiveTodoCountCubit({required this.todoListCubit, required this.activecount})
      : super(ActiveTodoCountState(currentActiveCount: activecount)) {
    todolistsub = todoListCubit.stream.listen((TodoListState todoListState) {
      int activecount = todoListState.todolist
          .where((element) => !element.completed)
          .toList()
          .length;

      emit(state.copyWith(currentActiveCount: activecount));
    });
  }

  @override
  Future<void> close() {
    todolistsub.cancel();
    return super.close();
  }
}
