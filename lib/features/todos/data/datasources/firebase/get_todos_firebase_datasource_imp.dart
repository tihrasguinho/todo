import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/features/auth/data/odts/user_odt.dart';
import 'package:todo/features/todos/data/datasources/get_todos_datasource.dart';
import 'package:todo/features/todos/domain/entities/todo_entity.dart';

class GetTodosFirebaseDatasourceImp implements GetTodosDatasource {
  @override
  Future<Either<Exception, List<TodoEntity>>> call() async {
    try {
      final firestore = FirebaseFirestore.instance;

      final app = Hive.box('app');

      final user = UserOdt.fromJson(app.get('user'));

      final query = await firestore.collection('todos').where('owner', isEqualTo: user.uid).get();

      if (query.docs.isNotEmpty) {
        final data = query.docs
            .map((e) => TodoEntity(
                  id: e.id,
                  owner: user.uid,
                  title: e.data()['title'],
                  subtitle: e.data()['subtitle'],
                  done: e.data()['done'],
                ))
            .toList();

        return Right(data);
      } else {
        return Left(Exception('Todo list is empty!'));
      }
    } on Exception catch (e) {
      return Left(Exception(e));
    }
  }
}
