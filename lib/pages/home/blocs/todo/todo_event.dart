part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

final class RequestToSubscribe extends TodoEvent {}

final class DeleteTodo extends TodoEvent {
  DeleteTodo(this.todo);
  final String todo;
}
