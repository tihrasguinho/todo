import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo/features/auth/domain/entities/signin_entity.dart';
import 'package:todo/features/auth/domain/entities/user_entity.dart';
import 'package:todo/features/auth/domain/repositories/signin_repository.dart';

class SigninRepositoryMock extends Mock implements SigninRepository {}

void main() {
  SigninRepository repository = SigninRepositoryMock();
  SigninEntity signinEntity = SigninEntity(
    email: 'admin@email.com',
    password: '123456',
  );

  test('Should return an UserEntity', () async {
    when(() => repository(signinEntity)).thenAnswer(
      (_) async => Right(
        UserEntity(
          uid: 'uuid',
          name: 'signinEntity.name',
          username: 'signinEntity.username',
          email: signinEntity.email,
          image: '',
          createdAt: DateTime.now().millisecondsSinceEpoch,
        ),
      ),
    );

    var result = await repository(signinEntity);

    expect(result.fold((l) => null, (r) => r), isInstanceOf<UserEntity>());
  });

  test('Should return an Exception', () async {
    when(() => repository(signinEntity)).thenAnswer(
      (_) async => Left(Exception('Fail')),
    );

    var result = await repository(signinEntity);

    expect(result.fold((l) => l, (r) => null), isException);
  });
}
