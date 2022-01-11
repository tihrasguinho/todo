import 'package:todo/features/auth/domain/entities/signin_entity.dart';
import 'package:todo/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:todo/features/auth/domain/repositories/signin_repository.dart';
import 'package:todo/features/auth/domain/usecases/signin_usecase.dart';

class SigninUsecaseImp implements SigninUsecase {
  final SigninRepository _signinRepository;

  SigninUsecaseImp(this._signinRepository);

  @override
  Future<Either<Exception, UserEntity>> call(SigninEntity entity) async {
    return await _signinRepository(entity);
  }
}
