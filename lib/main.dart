import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:utilities_helper/screens/splash/splash_screen.dart';

void main() {
  ApplicationRunner().run();
}

class ApplicationRunner {
  Future<void> initApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  Future<void> run() async {
    await initApp();
    runApp(App());
  }
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Utilities Helper',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: SplashScreen(),
    );
  }
}