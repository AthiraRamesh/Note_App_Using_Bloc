import 'package:get_it/get_it.dart';
import 'package:my_note_bloc/repositary/todo_repo/todo_repo.dart';

final lc = GetIt.instance;

void initializeDependencies() {
  lc.registerLazySingleton(() => TodoRepo());
}
