import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_note_bloc/lc.dart';
import 'package:my_note_bloc/pages/add_new_todo/blocs/bloc/new_todo_bloc.dart';

class AddNewTodoView extends StatelessWidget {
  const AddNewTodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewTodoBloc(lc()),
      child: const _AddNewTodo(),
    );
  }
}

class _AddNewTodo extends StatefulWidget {
  const _AddNewTodo({Key? key}) : super(key: key);

  @override
  State<_AddNewTodo> createState() => _AddNewTodoState();
}

class _AddNewTodoState extends State<_AddNewTodo> {
  final _textCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<NewTodoBloc, NewTodoState>(
      listener: (context, state) {
        if (state is Success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("New Todo created!"),
            ),
          );
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("New Todo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: TextFormField(
                  controller: _textCtrl,
                ),
              ),
              Align(
                child: ElevatedButton(
                  onPressed: () {
                    final newTask = _textCtrl.text;
                    final event = FormSubmit(newTask);
                    context.read<NewTodoBloc>().add(event);
                  },
                  child: const Text("Add"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
