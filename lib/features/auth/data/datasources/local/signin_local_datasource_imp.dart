import 'package:dartz/dartz.dart';
import 'package:todo/features/auth/data/datasources/signin_datasource.dart';
import 'package:todo/features/auth/domain/entities/user_entity.dart';
import 'package:todo/features/auth/domain/entities/signin_entity.dart';

class SigninLocalDatasourceImp implements SigninDatasource {
  @override
  Future<Either<Exception, UserEntity>> call(SigninEntity entity) async {
    if (!entity.validEmail) {
      return Left(Exception('Email not valid!'));
    }

    if (!entity.validPassword) {
      return Left(Exception('Password not valid!'));
    }

    return Right(
      UserEntity(
        uid: 'uidd',
        name: 'name',
        username: 'username',
        email: entity.email,
        image: '',
        createdAt: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }
}
