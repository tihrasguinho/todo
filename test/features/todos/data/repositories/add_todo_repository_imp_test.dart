import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo/features/todos/data/datasources/add_todo_datasource.dart';
import 'package:todo/features/todos/data/repositories/add_todo_repository_imp.dart';
import 'package:todo/features/todos/domain/entities/todo_entity.dart';
import 'package:todo/features/todos/domain/repositories/add_todo_repository.dart';

class AddTodoDatasourceMock extends Mock implements AddTodoDatasource {}

void main() {
  AddTodoDatasource datasource = AddTodoDatasourceMock();
  AddTodoRepository repository = AddTodoRepositoryImp(datasource);

  TodoEntity todo = TodoEntity(id: 'id', owner: 'owner', title: 'title', subtitle: 'subtitle');

  test('Should return true', () async {
    when(() => datasource(todo)).thenAnswer(
      (_) async => Right(
        TodoEntity(
          id: 'id',
          owner: 'owner',
          title: 'title',
          subtitle: 'subtitle',
        ),
      ),
    );

    var result = await repository(todo);

    expect(result.fold((l) => null, (r) => r), isA<TodoEntity>());
  });

  test('Should return an exception', () async {
    when(() => datasource(todo)).thenAnswer((_) async => Left(Exception('Fail')));

    var result = await repository(todo);

    expect(result.fold((l) => l, (r) => null), isException);
  });
}
