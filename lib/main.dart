import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Intellij_projects/UtilitiesHelper/lib/custom_widgets/custom_button.dart';
import 'file:///C:/Intellij_projects/UtilitiesHelper/lib/custom_widgets/custom_logo.dart';
import 'file:///C:/Intellij_projects/UtilitiesHelper/lib/custom_widgets/custom_text_input.dart';
import 'file:///C:/Intellij_projects/UtilitiesHelper/lib/custom_widgets/signWith_customButton.dart';
import 'package:utilities_helper/screens/splash/splash_screen.dart';

void main() {
  ApplicationRunner().run();
}

class ApplicationRunner{

  Future<void> initApp() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  Future<void> run() async{
    await initApp();
    runApp(MyApp());
  }

}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(
      ),
    );
  }

}