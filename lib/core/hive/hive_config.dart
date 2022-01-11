import 'package:hive_flutter/hive_flutter.dart';

class HiveConfig {
  static Future initialize() async {
    await Hive.initFlutter();

    var box = await Hive.openBox('app');

    if (!box.containsKey('signedIn')) box.put('signedIn', false);
  }
}
