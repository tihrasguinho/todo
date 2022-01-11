import 'dart:convert';

import 'package:todo/features/auth/domain/entities/user_entity.dart';

class UserOdt extends UserEntity {
  final String uidd;
  final String namee;
  final String usernamee;
  final String emaill;
  final String imagee;
  final int createdAtt;

  UserOdt({
    required this.uidd,
    required this.namee,
    required this.usernamee,
    required this.emaill,
    required this.imagee,
    required this.createdAtt,
  }) : super(
          uid: uidd,
          name: namee,
          username: usernamee,
          email: emaill,
          image: imagee,
          createdAt: createdAtt,
        );

  Map<String, dynamic> toMap() {
    return {
      'uid': uidd,
      'name': namee,
      'username': usernamee,
      'email': emaill,
      'image': imagee,
      'createdAt': createdAtt,
    };
  }

  factory UserOdt.fromMap(Map<String, dynamic> map) {
    return UserOdt(
      uidd: map['uid'] ?? '',
      namee: map['name'] ?? '',
      usernamee: map['username'] ?? '',
      emaill: map['email'] ?? '',
      imagee: map['image'] ?? '',
      createdAtt: map['createdAt']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserOdt.fromJson(String source) => UserOdt.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserOdt(uidd: $uidd, namee: $namee, usernamee: $usernamee, emaill: $emaill, imagee: $imagee, createdAtt: $createdAtt)';
  }
}
