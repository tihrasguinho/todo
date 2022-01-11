import 'package:dartz/dartz.dart';
import 'package:todo/features/todos/data/datasources/get_todos_datasource.dart';
import 'package:todo/features/todos/domain/entities/todo_entity.dart';
import 'package:todo/features/todos/domain/repositories/get_todos_repository.dart';

class GetTodosRepositoryImp implements GetTodosRepository {
  final GetTodosDatasource _getTodosDatasource;

  GetTodosRepositoryImp(this._getTodosDatasource);

  @override
  Future<Either<Exception, List<TodoEntity>>> call() async {
    return _getTodosDatasource();
  }
}
