import 'package:todo/features/todos/domain/entities/todo_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:todo/features/todos/domain/repositories/make_done_repository.dart';
import 'package:todo/features/todos/domain/usecases/make_done_usecase.dart';

class MakeDoneUsecaseImp implements MakeDoneUsecase {
  final MakeDoneRepository _makeDoneRepository;

  MakeDoneUsecaseImp(this._makeDoneRepository);

  @override
  Future<Either<Exception, bool>> call(TodoEntity todo) async {
    return await _makeDoneRepository(todo);
  }
}
