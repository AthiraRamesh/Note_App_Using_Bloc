part of 'new_todo_bloc.dart';

@immutable
sealed class NewTodoEvent {}

final class FormSubmit extends NewTodoEvent {
  FormSubmit(this.newTask);
  final String newTask;
}
