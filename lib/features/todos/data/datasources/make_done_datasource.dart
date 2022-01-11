import 'package:dartz/dartz.dart';
import 'package:todo/features/todos/domain/entities/todo_entity.dart';

abstract class MakeDoneDatasource {
  Future<Either<Exception, bool>> call(TodoEntity todo);
}
