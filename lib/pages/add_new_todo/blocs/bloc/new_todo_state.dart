part of 'new_todo_bloc.dart';

@immutable
sealed class NewTodoState {}

final class NewTodoInitial extends NewTodoState {}

final class Success extends NewTodoState {}

final class Failure extends NewTodoState {}
