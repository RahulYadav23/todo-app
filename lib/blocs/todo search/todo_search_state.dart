part of 'todo_search_cubit.dart';

class TodoSearchState extends Equatable {
  final String searchTerm;
  const TodoSearchState({required this.searchTerm});

  @override
  List<Object> get props => [searchTerm];

  factory TodoSearchState.initial() {
    return const TodoSearchState(searchTerm: "");
  }

  TodoSearchState copyWith({
    String? searchTerm,
  }) {
    return TodoSearchState(
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }

  @override
  String toString() => "TodoSearchState(searchTerm: $searchTerm)";
}
