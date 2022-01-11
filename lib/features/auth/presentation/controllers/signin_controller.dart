import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo/features/auth/domain/entities/signin_entity.dart';
import 'package:todo/features/auth/domain/usecases/signin_usecase.dart';

class SigninController extends Disposable {
  final SigninUsecase _signinUsecase;

  SigninController(this._signinUsecase);

  final email = TextEditingController();
  final password = TextEditingController();

  Future signIn() async {
    final result = await _signinUsecase(SigninEntity(email: email.text, password: password.text));

    result.fold((left) {
      print(left.toString());
    }, (right) {
      print(right.toString());

      kIsWeb ? Modular.to.navigate('/') : Modular.to.pushReplacementNamed('/');
    });
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
  }
}
