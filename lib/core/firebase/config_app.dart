import 'package:firebase_core/firebase_core.dart';

class ConfigApp {
  static Future initialize() async {
    const options = FirebaseOptions(
      apiKey: "AIzaSyDII1Hk4M9uk9E20Awp8JJXz4-v8xDa7eM",
      authDomain: "todo-clean-arch-8586b.firebaseapp.com",
      projectId: "todo-clean-arch-8586b",
      storageBucket: "todo-clean-arch-8586b.appspot.com",
      messagingSenderId: "285379435495",
      appId: "1:285379435495:web:04ddb23ad118b06f3b7b42",
    );

    await Firebase.initializeApp(options: options);
  }
}
