import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:my_note_bloc/repositary/todo_repo/todo_repo.dart';

part 'new_todo_event.dart';
part 'new_todo_state.dart';

class NewTodoBloc extends Bloc<NewTodoEvent, NewTodoState> {
  NewTodoBloc(this.todoRepo) : super(NewTodoInitial()) {
    on<FormSubmit>(_formSubmit);
  }
  final TodoRepo todoRepo;
  void _formSubmit(FormSubmit event, Emitter<NewTodoState> emit) {
    final newTask = event.newTask;
    todoRepo.addNewTodo(newTask);
    emit(Success());
  }
}
