import 'package:todo/features/auth/data/datasources/signin_datasource.dart';
import 'package:todo/features/auth/domain/entities/user_entity.dart';
import 'package:todo/features/auth/domain/entities/signin_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:todo/features/auth/domain/repositories/signin_repository.dart';

class SigninRepositoryImp implements SigninRepository {
  final SigninDatasource _signinDatasource;

  SigninRepositoryImp(this._signinDatasource);

  @override
  Future<Either<Exception, UserEntity>> call(SigninEntity entity) async {
    return await _signinDatasource(entity);
  }
}
