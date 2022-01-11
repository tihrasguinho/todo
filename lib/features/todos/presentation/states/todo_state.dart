import 'package:todo/features/todos/domain/entities/todo_entity.dart';

abstract class TodoState {}

class Initial implements TodoState {}

class Loading implements TodoState {}

class Success implements TodoState {
  final List<TodoEntity> todos;

  Success(this.todos);
}

class Error implements TodoState {
  final String error;

  Error(this.error);
}
