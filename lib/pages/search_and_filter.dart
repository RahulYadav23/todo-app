import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/blocs/cubits.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/utils/debounce.dart';

class SearchAndFilter extends StatelessWidget {
  SearchAndFilter({super.key});
  final debounce = Debounce(milliseconds: 1000);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
            labelText: 'Search todos...',
            border: InputBorder.none,
            filled: true,
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (value) {
            debounce.run(() {
              context.read<TodoSearchCubit>().searchTerm(value);
            });
          },
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            filterButton(context, Filter.all),
            filterButton(context, Filter.active),
            filterButton(context, Filter.completed),
          ],
        )
      ],
    );
  }

  Widget filterButton(BuildContext context, Filter filter) {
    return TextButton(
        onPressed: () {
          context.read<TodoFilterCubit>().changeFilter(filter);
        },
        child: Text(
          filter == Filter.all
              ? "All"
              : filter == Filter.active
                  ? "Active"
                  : "Completed",
          style: TextStyle(
            fontSize: 18.0,
            color: textColor(context, filter),
          ),
        ));
  }

  Color textColor(BuildContext context, Filter filter) {
    final currentFilter = context.watch<TodoFilterCubit>().state.filter;
    return currentFilter == filter ? Colors.blue : Colors.grey;
  }
}
