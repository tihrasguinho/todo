import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:todo/features/todos/data/datasources/make_done_datasource.dart';
import 'package:todo/features/todos/domain/entities/todo_entity.dart';

class MakeDoneFirebaseDatasourceImp implements MakeDoneDatasource {
  @override
  Future<Either<Exception, bool>> call(TodoEntity todo) async {
    try {
      final firestore = FirebaseFirestore.instance;

      if (!todo.isDone) {
        return Left(Exception('Todo is not marked as done!'));
      }

      await firestore.collection('todos').doc(todo.id).update({
        'title': todo.title,
        'subtitle': todo.subtitle,
        'done': todo.done,
      });

      return Right(true);
    } on Exception catch (e) {
      return Left(Exception(e));
    }
  }
}
