import 'package:dartz/dartz.dart';
import 'package:todo/features/todos/data/datasources/get_todos_datasource.dart';
import 'package:todo/features/todos/data/odts/todo_odt.dart';
import 'package:todo/features/todos/domain/entities/todo_entity.dart';

class GetTodosLocalDatasourceImp implements GetTodosDatasource {
  final json = [
    {'todo_title': 'title1', 'todo_subtitle': 'subtitle1'},
    {'todo_title': 'title2', 'todo_subtitle': 'subtitle2'},
  ];

  @override
  Future<Either<Exception, List<TodoEntity>>> call() async {
    try {
      final data = json.map((e) => TodoOdt.fromMap(e)).toList();

      return Right(data);
    } on Exception catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
