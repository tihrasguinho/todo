import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/features/auth/data/datasources/signin_datasource.dart';
import 'package:todo/features/auth/data/odts/user_odt.dart';
import 'package:todo/features/auth/domain/entities/user_entity.dart';
import 'package:todo/features/auth/domain/entities/signin_entity.dart';

class SigninFirebaseDatasourceImp implements SigninDatasource {
  @override
  Future<Either<Exception, UserEntity>> call(SigninEntity entity) async {
    try {
      final auth = FirebaseAuth.instance;
      final firestore = FirebaseFirestore.instance;

      if (!entity.validEmail) {
        return Left(Exception('Email not valid!'));
      }

      if (!entity.validPassword) {
        return Left(Exception('Password not valid!'));
      }

      final result = await auth.signInWithEmailAndPassword(
        email: entity.email,
        password: entity.password,
      );

      final query = await firestore.collection('users').doc(result.user!.uid).get();

      if (!query.exists) {
        final userx = UserOdt.fromMap({
          'name': '',
          'username': '',
          'email': entity.email,
          'image': '',
          'createdAt': DateTime.now().toUtc().millisecondsSinceEpoch,
        });

        await firestore.collection('users').doc(result.user!.uid).set(userx.toMap());

        return Right(userx);
      } else {
        final user = UserOdt.fromMap({...query.data() as Map<String, dynamic>, 'uid': result.user!.uid});

        var app = Hive.box('app');

        app.put('user', user.toJson());

        app.put('signedIn', true);

        return Right(user);
      }
    } on Exception catch (e) {
      return Left(Exception(e));
    }
  }
}
