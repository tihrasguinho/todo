class SigninEntity {
  final String email;
  final String password;

  SigninEntity({
    required this.email,
    required this.password,
  });

  bool get validEmail => !email.contains(' ') && email.contains('@') && email.contains('.com');

  bool get validPassword => password.length >= 6;
}
