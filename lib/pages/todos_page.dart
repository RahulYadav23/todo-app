import 'package:flutter/material.dart';
import 'package:todo/pages/create_todo.dart';
import 'package:todo/pages/search_and_filter.dart';
import 'package:todo/pages/show_todo.dart';
import 'package:todo/pages/todo_header.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              children: [
                const TodoHeader(),
                const CreateTodo(),
                const SizedBox(
                  height: 20,
                ),
                SearchAndFilter(),
                const ShowTodos(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
