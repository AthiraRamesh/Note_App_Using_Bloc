part of 'todo_bloc.dart';

@immutable
sealed class TodoState {
  const TodoState(this.todoStream);
  final Stream<List<String>>? todoStream;
}

final class TodoInitial extends TodoState {
  const TodoInitial() : super(null);
}

final class SubscriberToTodoStream extends TodoState {
  const SubscriberToTodoStream(super.todoStream);
}
