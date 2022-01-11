import 'package:flutter_test/flutter_test.dart';
import 'package:todo/features/auth/data/datasources/local/signin_local_datasource_imp.dart';
import 'package:todo/features/auth/data/datasources/signin_datasource.dart';
import 'package:todo/features/auth/data/repositories/signin_repository_imp.dart';
import 'package:todo/features/auth/domain/entities/signin_entity.dart';
import 'package:todo/features/auth/domain/entities/user_entity.dart';
import 'package:todo/features/auth/domain/repositories/signin_repository.dart';

void main() {
  SigninDatasource datasource = SigninLocalDatasourceImp();
  SigninRepository repository = SigninRepositoryImp(datasource);

  test('Should return an UserEntity', () async {
    SigninEntity signinEntity = SigninEntity(
      email: 'admin@email.com',
      password: '123456',
    );

    var result = await repository(signinEntity);

    expect(result.fold((l) => l, (r) => r), isInstanceOf<UserEntity>());
  });

  test('Should return an Exception', () async {
    SigninEntity signinEntity = SigninEntity(
      email: 'adminemail.com',
      password: '123456',
    );

    var result = await repository(signinEntity);

    expect(result.fold((l) => l, (r) => r), isException);
  });
}
