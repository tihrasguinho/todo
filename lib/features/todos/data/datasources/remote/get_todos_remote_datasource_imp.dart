import 'package:dartz/dartz.dart';
import 'package:todo/features/todos/data/datasources/get_todos_datasource.dart';
import 'package:todo/features/todos/data/odts/todo_odt.dart';
import 'package:todo/features/todos/domain/entities/todo_entity.dart';
import 'package:uno/uno.dart';

class GetTodosRemoteDatasourceImp implements GetTodosDatasource {
  final Uno uno;

  GetTodosRemoteDatasourceImp(this.uno);

  @override
  Future<Either<Exception, List<TodoEntity>>> call() async {
    try {
      final response = await uno.get('/todos');

      if (response.status == 200) {
        final data = response.data as List;

        final todos = data.map((e) => TodoOdt.fromMap(e)).toList();

        return Right(todos);
      } else {
        return Left(Exception('Status Code ${response.status}'));
      }
    } on Exception catch (e) {
      return Left(Exception(e));
    }
  }
}
