import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_note_bloc/pages/home/blocs/todo/todo_bloc.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({required this.task, super.key});
  final String task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      margin: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.blueGrey),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            task,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          IconButton(
              onPressed: () {
                context.read<TodoBloc>().add(DeleteTodo(task));
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
