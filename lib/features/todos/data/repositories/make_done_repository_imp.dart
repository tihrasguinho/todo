import 'package:todo/features/todos/data/datasources/make_done_datasource.dart';
import 'package:todo/features/todos/domain/entities/todo_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:todo/features/todos/domain/repositories/make_done_repository.dart';

class MakeDoneRepositoryImp implements MakeDoneRepository {
  final MakeDoneDatasource _makeDoneDatasource;

  MakeDoneRepositoryImp(this._makeDoneDatasource);

  @override
  Future<Either<Exception, bool>> call(TodoEntity todo) async {
    return await _makeDoneDatasource(todo);
  }
}
