import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_note_bloc/lc.dart';
import 'package:my_note_bloc/pages/add_new_todo/views/add_new_todo.dart';
import 'package:my_note_bloc/pages/home/blocs/todo/todo_bloc.dart';
import 'package:my_note_bloc/pages/home/views/task_tile.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(lc())..add(RequestToSubscribe()),
      lazy: false,
      child: const _Home(),
    );
  }
}

class _Home extends StatelessWidget {
  // ignore: unused_element
  const _Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todos')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddNewTodoView(),
          ),
        ),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            if (state.todoStream == null) {
              return _buildNoData();
            }
            return StreamBuilder(
              stream: state.todoStream,
              builder: (context, snap) {
                if (snap.data == null) {
                  return _buildNoTodos();
                }
                final tasks = snap.data;

                return ListView(
                  children: tasks!.map((task) => TaskTile(task: task)).toList(),
                );
                // return GridView.builder(
                //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount:
                //         2, // You can adjust the number of columns as needed
                //     crossAxisSpacing:
                //         10.0, // Adjust the spacing between columns
                //     mainAxisSpacing: 10.0, // Adjust the spacing between rows
                //   ),
                //   itemBuilder: (context, index) {
                //     return TaskTile(task: tasks[index]);
                //   },
                //   itemCount: tasks!.length,
                // );
              },
            );
          },
        ),
      ),
    );
  }

  Center _buildNoTodos() {
    return const Center(
      child: Text("No todos to show.."),
    );
  }

  Center _buildNoData() {
    return const Center(
      child: Text("No Data"),
    );
  }
}
