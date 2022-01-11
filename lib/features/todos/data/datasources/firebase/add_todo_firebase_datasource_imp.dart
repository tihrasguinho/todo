import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/features/auth/data/odts/user_odt.dart';
import 'package:todo/features/todos/data/datasources/add_todo_datasource.dart';
import 'package:todo/features/todos/data/odts/todo_odt.dart';
import 'package:todo/features/todos/domain/entities/todo_entity.dart';

class AddTodoFirebaseDatasourceImp implements AddTodoDatasource {
  @override
  Future<Either<Exception, TodoEntity>> call(TodoEntity todo) async {
    try {
      final firestore = FirebaseFirestore.instance;

      final app = Hive.box('app');

      final user = UserOdt.fromJson(app.get('user'));

      final map = {
        'owner': user.uidd,
        'title': todo.title,
        'subtitle': todo.subtitle,
        'done': todo.done,
      };

      var data = await firestore.collection('todos').add(map);

      map.addAll({'id': data.id});

      return Right(TodoOdt.fromMap(map));
    } on Exception catch (e) {
      return Left(Exception(e));
    }
  }
}
