import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo/features/auth/data/datasources/firebase/signin_firebase_datasource_imp.dart';
import 'package:todo/features/auth/data/repositories/signin_repository_imp.dart';
import 'package:todo/features/auth/domain/usecases/signin_usecase_imp.dart';
import 'package:todo/features/auth/presentation/controllers/signin_controller.dart';
import 'package:todo/features/auth/presentation/ui/signin_page.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => SigninFirebaseDatasourceImp()),
        Bind.lazySingleton((i) => SigninRepositoryImp(i())),
        Bind.lazySingleton((i) => SigninUsecaseImp(i())),
        Bind.lazySingleton((i) => SigninController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => SigninPage()),
      ];
}
