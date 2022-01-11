import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeGuard extends RouteGuard {
  HomeGuard() : super(redirectTo: '/auth/');

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    var app = Hive.box('app');

    return app.get('signedIn');
  }
}
