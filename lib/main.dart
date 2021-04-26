import "package:flutter/material.dart";
import "package:flutter/src/material/colors.dart";

import "login_page.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Utilities Helper",
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: LoginPage(),
    );
  }
}