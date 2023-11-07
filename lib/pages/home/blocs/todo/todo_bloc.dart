import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:my_note_bloc/repositary/todo_repo/todo_repo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc(this.todoRepo) : super(const TodoInitial()) {
    on<RequestToSubscribe>(_subscribeToStream);
    on<DeleteTodo>(_deleteTodo);
  }
  final TodoRepo todoRepo;
  void _subscribeToStream(RequestToSubscribe event, Emitter<TodoState> emit) {
    final subscription = todoRepo.subscribeToStream();
    emit(SubscriberToTodoStream(subscription));
  }

  void _deleteTodo(DeleteTodo event, Emitter<TodoState> emit) {
    final task = event.todo;
    todoRepo.deleteTodo(task);
  }
}
