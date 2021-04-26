import 'package:flutter/material.dart';
import 'file:///C:/Intellij_projects/UtilitiesHelper/lib/custom_widgets/custom_button.dart';
import 'file:///C:/Intellij_projects/UtilitiesHelper/lib/custom_widgets/custom_logo.dart';
import 'file:///C:/Intellij_projects/UtilitiesHelper/lib/custom_widgets/custom_text_input.dart';
import 'file:///C:/Intellij_projects/UtilitiesHelper/lib/custom_widgets/signWith_customButton.dart';

void main() {
  runApp(MyApp());
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
      home: Scaffold(
        backgroundColor: Color.fromRGBO(206, 212, 249, 1),
        resizeToAvoidBottomInset: false,
        body: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    TextEditingController loginEditingController = TextEditingController();
    TextEditingController passwordEditingController = TextEditingController();

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 36, vertical: 10),
        child: ListView(children: <Widget>[
          Column(children: <Widget>[
            CustomLogo(underTitle: "Авторизація"),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: CustomTextInput(
                title: 'Логін',
                textEditingController: loginEditingController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CustomTextInput(
                  title: 'Пароль',
                  textEditingController: passwordEditingController),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(),
                child: Text(
                  "Забули пароль?",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Color.fromRGBO(40, 53, 85, 0.5),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            CustomButton(content: 'Увійти', height: 65, width: 196),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 12),
              child: CustomButton(
                content: "Реєстрація в Utilities Helper",
                height: 50,
                width: 300,
                color: Colors.white,
                fontSize: 18,
                fontColor: Color.fromRGBO(40, 53, 85, 1),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  height: 1,
                  width: 141,
                  color: Colors.black,
                ),
                Text("Або"),
                Container(
                  height: 1,
                  width: 141,
                  color: Colors.black,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SignWithCustomButton(
                height: 50,
                content: "Увійти з Google",
                icon: 'assets/Google_icon-icons.com_66793.png',
              ),
            )
          ]),
        ]),
      ),
    );
  }
}
