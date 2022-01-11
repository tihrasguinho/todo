import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo/features/todos/data/datasources/make_done_datasource.dart';
import 'package:todo/features/todos/data/odts/todo_odt.dart';
import 'package:todo/features/todos/data/repositories/make_done_repository_imp.dart';
import 'package:todo/features/todos/domain/entities/todo_entity.dart';
import 'package:todo/features/todos/domain/repositories/make_done_repository.dart';

class MakeDoneDatasourceMock extends Mock implements MakeDoneDatasource {}

void main() {
  MakeDoneDatasource datasource = MakeDoneDatasourceMock();
  MakeDoneRepository repository = MakeDoneRepositoryImp(datasource);

  final todo = TodoEntity(id: 'id', owner: 'owner', title: 'title', subtitle: 'subtitle', done: true);
  test('Should return true to update', () async {
    when(() => datasource(todo)).thenAnswer((_) async => Right(true));

    final result = await repository(todo);

    expect(result.fold((l) => null, (r) => r), equals(true));
  });

  test('Should return an exception', () async {
    when(() => datasource(todo)).thenAnswer((_) async => Left(Exception('Fail')));

    final result = await repository(todo);

    expect(result.fold((l) => l, (r) => r), isException);
  });
}
