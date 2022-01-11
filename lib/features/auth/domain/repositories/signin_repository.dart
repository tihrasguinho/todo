import 'package:dartz/dartz.dart';
import 'package:todo/features/auth/domain/entities/signin_entity.dart';
import 'package:todo/features/auth/domain/entities/user_entity.dart';

abstract class SigninRepository {
  Future<Either<Exception, UserEntity>> call(SigninEntity entity);
}
