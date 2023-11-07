import 'dart:async';

class TodoRepo {
  final List<String> _todos = [];
  final _streamController = StreamController<List<String>>.broadcast();

  Stream<List<String>> subscribeToStream() {
    _streamController.sink.add(_todos);
    return _streamController.stream;
  }

  void addNewTodo(String todo) {
    _todos.add(todo);
    _streamController.sink.add(_todos);
  }

  void deleteTodo(String todo) {
    _todos.remove(todo);
    _streamController.sink.add(_todos);
  }
}
