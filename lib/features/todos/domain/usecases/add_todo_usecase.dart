import 'package:dartz/dartz.dart';
import 'package:todo/features/todos/domain/entities/todo_entity.dart';

abstract class AddTodoUsecase {
  Future<Either<Exception, TodoEntity>> call(TodoEntity todo);
}
