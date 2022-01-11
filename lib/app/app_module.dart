import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo/app/modules/auth/auth_module.dart';
import 'package:todo/app/modules/todos/todos_module.dart';
import 'package:todo/core/guards/auth_guard.dart';
import 'package:todo/core/guards/home_guard.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: TodosModule(), guards: [HomeGuard()]),
        ModuleRoute('/auth', module: AuthModule(), guards: [AuthGuard()]),
      ];
}
