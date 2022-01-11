// import 'package:get_it/get_it.dart';
// import 'package:todo/features/todos/data/datasources/add_todo_datasource.dart';
// import 'package:todo/features/todos/data/datasources/get_todos_datasource.dart';
// import 'package:todo/features/todos/data/datasources/remote/add_todo_remote_datasource_imp.dart';
// import 'package:todo/features/todos/data/datasources/remote/get_todos_remote_datasource_imp.dart';
// import 'package:todo/features/todos/data/repositories/add_todo_repository_imp.dart';
// import 'package:todo/features/todos/data/repositories/get_todos_repository_imp.dart';
// import 'package:todo/features/todos/domain/repositories/add_todo_repository.dart';
// import 'package:todo/features/todos/domain/repositories/get_todos_repository.dart';
// import 'package:todo/features/todos/domain/usecases/add_todo_usecase.dart';
// import 'package:todo/features/todos/domain/usecases/add_todo_usecase_imp.dart';
// import 'package:todo/features/todos/domain/usecases/get_todos_usecase.dart';
// import 'package:todo/features/todos/domain/usecases/get_todos_usecase_imp.dart';
// import 'package:todo/features/todos/presentation/controller/todos_controller.dart';
// import 'package:todo/features/todos/presentation/stores/todos_store.dart';
// import 'package:uno/uno.dart';

// class Inject {
//   static void init() {
//     final getIt = GetIt.instance;

//     getIt.registerLazySingleton<Uno>(() => Uno(baseURL: 'http://localhost:3031'));

//     getIt.registerLazySingleton<AddTodoDatasource>(() => AddTodoRemoteDatasourceImp(getIt()));

//     getIt.registerLazySingleton<GetTodosDatasource>(() => GetTodosRemoteDatasourceImp(getIt()));

//     getIt.registerLazySingleton<GetTodosRepository>(() => GetTodosRepositoryImp(getIt()));

//     getIt.registerLazySingleton<AddTodoRepository>(() => AddTodoRepositoryImp(getIt()));

//     getIt.registerLazySingleton<GetTodosUsecase>(() => GetTodosUsecaseImp(getIt()));

//     getIt.registerLazySingleton<AddTodoUsecase>(() => AddTodoUsecaseImp(getIt()));

//     getIt.registerLazySingleton<TodosStore>(() => TodosStore(getIt(), getIt()));

//     getIt.registerLazySingleton<GetTodosController>(() => GetTodosController(getIt()));
//   }
// }
