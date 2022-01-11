import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo/features/todos/domain/entities/todo_entity.dart';
import 'package:todo/features/todos/domain/repositories/add_todo_repository.dart';
import 'package:todo/features/todos/domain/usecases/add_todo_usecase.dart';
import 'package:todo/features/todos/domain/usecases/add_todo_usecase_imp.dart';

class AddTodoRepositoryMock extends Mock implements AddTodoRepository {}

void main() {
  AddTodoRepository repository = AddTodoRepositoryMock();
  AddTodoUsecase usecase = AddTodoUsecaseImp(repository);

  TodoEntity todo = TodoEntity(id: 'id', owner: 'owner', title: 'title', subtitle: 'subtitle');

  test('Should return true', () async {
    when(() => repository(todo)).thenAnswer(
      (_) async => Right(
        TodoEntity(
          id: 'id',
          owner: 'owner',
          title: 'title',
          subtitle: 'subtitle',
        ),
      ),
    );

    var result = await usecase(todo);

    expect(result.fold((l) => null, (r) => r), isA<TodoEntity>());
  });

  test('Should return an exception', () async {
    when(() => repository(todo)).thenAnswer(
      (_) async => Left(Exception('Fail')),
    );

    var result = await usecase(todo);

    expect(result.fold((l) => l, (r) => null), isException);
  });
}
