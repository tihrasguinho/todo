import 'package:todo/features/todos/domain/entities/todo_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:todo/features/todos/domain/repositories/get_todos_repository.dart';
import 'package:todo/features/todos/domain/usecases/get_todos_usecase.dart';

class GetTodosUsecaseImp implements GetTodosUsecase {
  final GetTodosRepository _getTodosRepository;

  GetTodosUsecaseImp(this._getTodosRepository);

  @override
  Future<Either<Exception, List<TodoEntity>>> call() async {
    return await _getTodosRepository();
  }
}
