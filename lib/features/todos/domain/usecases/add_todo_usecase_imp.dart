import 'package:dartz/dartz.dart';
import 'package:todo/features/todos/domain/entities/todo_entity.dart';
import 'package:todo/features/todos/domain/repositories/add_todo_repository.dart';
import 'package:todo/features/todos/domain/usecases/add_todo_usecase.dart';

class AddTodoUsecaseImp implements AddTodoUsecase {
  final AddTodoRepository _addTodoRepository;

  AddTodoUsecaseImp(this._addTodoRepository);

  @override
  Future<Either<Exception, TodoEntity>> call(TodoEntity todo) async {
    return await _addTodoRepository(todo);
  }
}
