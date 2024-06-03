import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/blocs/cubits.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "TODO",
          style: TextStyle(
            fontSize: 40,
          ),
        ),
        Text(
          "${context.watch<ActiveTodoCountCubit>().state.currentActiveCount} items left",
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
