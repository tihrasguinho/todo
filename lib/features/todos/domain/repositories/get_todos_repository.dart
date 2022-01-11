import 'package:dartz/dartz.dart';
import 'package:todo/features/todos/domain/entities/todo_entity.dart';

abstract class GetTodosRepository {
  Future<Either<Exception, List<TodoEntity>>> call();
}
