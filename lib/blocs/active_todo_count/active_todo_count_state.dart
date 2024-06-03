part of 'active_todo_count_cubit.dart';

class ActiveTodoCountState extends Equatable {
  final int currentActiveCount;
  const ActiveTodoCountState({
    required this.currentActiveCount,
  });

  factory ActiveTodoCountState.initial() {
    return const ActiveTodoCountState(currentActiveCount: 0);
  }

  ActiveTodoCountState copyWith({
    int? currentActiveCount,
  }) {
    return ActiveTodoCountState(
      currentActiveCount: currentActiveCount ?? this.currentActiveCount,
    );
  }

  @override
  String toString() =>
      "ActiveTodoCountState(currentActiveCount: $currentActiveCount)";

  @override
  List<Object> get props => [currentActiveCount];
}
