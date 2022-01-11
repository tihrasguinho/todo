import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo/features/todos/data/datasources/firebase/add_todo_firebase_datasource_imp.dart';
import 'package:todo/features/todos/data/datasources/firebase/get_todos_firebase_datasource_imp.dart';
import 'package:todo/features/todos/data/datasources/firebase/make_done_firebase_datasource_imp.dart';
import 'package:todo/features/todos/data/repositories/add_todo_repository_imp.dart';
import 'package:todo/features/todos/data/repositories/get_todos_repository_imp.dart';
import 'package:todo/features/todos/data/repositories/make_done_repository_imp.dart';
import 'package:todo/features/todos/domain/usecases/add_todo_usecase_imp.dart';
import 'package:todo/features/todos/domain/usecases/get_todos_usecase_imp.dart';
import 'package:todo/features/todos/domain/usecases/make_done_usecase_imp.dart';
import 'package:todo/features/todos/presentation/stores/todos_store.dart';
import 'package:todo/features/todos/presentation/ui/todos_page.dart';
import 'package:uno/uno.dart';

class TodosModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => Uno(baseURL: 'http://localhost:3031')),
        Bind.lazySingleton((i) => GetTodosFirebaseDatasourceImp()),
        Bind.lazySingleton((i) => AddTodoFirebaseDatasourceImp()),
        Bind.lazySingleton((i) => MakeDoneFirebaseDatasourceImp()),
        Bind.lazySingleton((i) => AddTodoRepositoryImp(i())),
        Bind.lazySingleton((i) => GetTodosRepositoryImp(i())),
        Bind.lazySingleton((i) => MakeDoneRepositoryImp(i())),
        Bind.lazySingleton((i) => AddTodoUsecaseImp(i())),
        Bind.lazySingleton((i) => GetTodosUsecaseImp(i())),
        Bind.lazySingleton((i) => MakeDoneUsecaseImp(i())),
        Bind.lazySingleton((i) => TodosStore(i(), i(), i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => TodosPage()),
      ];
}
