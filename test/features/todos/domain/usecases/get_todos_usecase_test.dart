import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo/features/todos/data/datasources/get_todos_datasource.dart';
import 'package:todo/features/todos/data/repositories/get_todos_repository_imp.dart';
import 'package:todo/features/todos/domain/entities/todo_entity.dart';
import 'package:todo/features/todos/domain/usecases/get_todos_usecase.dart';
import 'package:todo/features/todos/domain/usecases/get_todos_usecase_imp.dart';

class GetTodosDatasourceMock extends Mock implements GetTodosDatasource {}

final data = [
  TodoEntity(id: 'id1', owner: 'owner1', title: 'title1', subtitle: 'subtitle1'),
  TodoEntity(id: 'id2', owner: 'owner2', title: 'title2', subtitle: 'subtitle2'),
];

void main() {
  GetTodosDatasource datasource = GetTodosDatasourceMock();
  GetTodosUsecase usecase = GetTodosUsecaseImp(
    GetTodosRepositoryImp(datasource),
  );

  test('Should return a right', () async {
    when(() => datasource()).thenAnswer(
      (_) async => Right(data),
    );

    var result = await usecase();

    expect(result.isRight(), equals(true));
  });

  test('Should return two items', () async {
    when(() => datasource()).thenAnswer(
      (_) async => Right(data),
    );

    var result = await usecase();

    expect(result.fold((l) => null, (r) => r)!.length, equals(2));
  });

  test('Should return first item with title1 for title', () async {
    when(() => datasource()).thenAnswer(
      (_) async => Right(data),
    );

    var result = await usecase();

    var title1 = result.fold((l) => null, (r) => r)!.first.title;

    expect(title1, equals('title1'));
  });

  test('Should return an exception', () async {
    when(() => datasource()).thenAnswer((_) async => Left(Exception()));

    var result = await usecase();

    expect(result.fold((l) => l, (r) => null), isException);
  });
}
