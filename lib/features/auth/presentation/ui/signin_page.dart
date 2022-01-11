import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo/features/auth/presentation/controllers/signin_controller.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  SigninController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          controller.email.text = 'admin@admin.com';
          controller.password.text = '123456';
          await controller.signIn();
        },
        label: Text('SignIn'),
      ),
    );
  }
}
