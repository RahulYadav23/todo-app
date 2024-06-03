part of 'filtered_todos_cubit.dart';

class FilteredTodosState extends Equatable {
  final List<Todo> filteredtodos;

  const FilteredTodosState({required this.filteredtodos});

  factory FilteredTodosState.initial() {
    return const FilteredTodosState(filteredtodos: []);
  }

  FilteredTodosState copyWith({
    List<Todo>? filteredtodos,
  }) {
    return FilteredTodosState(
      filteredtodos: filteredtodos ?? this.filteredtodos,
    );
  }

  @override
  String toString() => "FilteredTodosState(filteredtodos: $filteredtodos)";

  @override
  List<Object> get props => [filteredtodos];
}
