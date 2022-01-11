import 'package:todo/features/todos/data/datasources/add_todo_datasource.dart';
import 'package:todo/features/todos/domain/entities/todo_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:todo/features/todos/domain/repositories/add_todo_repository.dart';

class AddTodoRepositoryImp implements AddTodoRepository {
  final AddTodoDatasource _addTodoDatasource;

  AddTodoRepositoryImp(this._addTodoDatasource);

  @override
  Future<Either<Exception, TodoEntity>> call(TodoEntity todo) async {
    return await _addTodoDatasource(todo);
  }
}
