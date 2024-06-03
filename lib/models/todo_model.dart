import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

enum Filter {
  all,
  active,
  completed,
}

class Todo extends Equatable {
  final String id;
  final String description;
  final bool completed;

  Todo({String? id, required this.description, this.completed = false})
      : id = id ?? uuid.v4();

  @override
  List<Object?> get props => [id, description, completed];

  @override
  String toString() =>
      'Todo(id: $id, desc: $description, completed: $completed)';
}
