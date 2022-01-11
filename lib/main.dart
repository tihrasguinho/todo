import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo/app/app_module.dart';
import 'package:todo/app/app_widget.dart';
import 'package:todo/core/firebase/config_app.dart';
import 'package:todo/core/hive/hive_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ConfigApp.initialize();

  await HiveConfig.initialize();

  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
