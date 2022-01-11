import 'package:flutter_test/flutter_test.dart';
import 'package:todo/features/auth/domain/entities/signin_entity.dart';

void main() {
  SigninEntity entity = SigninEntity(
    email: 'email@gmail.com',
    password: 'password',
  );
  test('Should not null', () {
    expect(entity, isNotNull);
  });

  test('EMAIL: Should be a valid email', () {
    expect(entity.validEmail, equals(true));
  });

  test('PASSWORD: Should be 6 characteres or higher', () {
    expect(entity.validPassword, equals(true));
  });
}
