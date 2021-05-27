import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utilities_helper/cubit/auth/auth_cubit.dart';
import 'package:utilities_helper/cubit/auth/auth_state.dart';
import 'package:utilities_helper/custom_widgets/custom_button.dart';
import 'package:utilities_helper/custom_widgets/custom_logo.dart';
import 'package:utilities_helper/custom_widgets/custom_text_input.dart';
import 'package:utilities_helper/custom_widgets/signWith_customButton.dart';
import 'package:utilities_helper/screens/home/home_screen.dart';
import 'package:utilities_helper/utils/navigation_utils.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final authCubit = AuthCubit();

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

    return BlocListener<AuthCubit, AuthState>(
      bloc: authCubit,
      listener: (_, state) {
        if (!state.isLoading && state.currentUser != null) {
          NavigationUtils.toScreenRemoveUntil(context,
              screen: HomeScreen(
                currentUser: state.currentUser,
              ));
        }
      },
      child: SafeArea(
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
              CustomButton(
                content: 'Увійти',
                height: 65,
                width: 196,
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 12),
                child: CustomButton(
                  content: "Реєстрація в Utilities Helper",
                  height: 50,
                  width: 300,
                  color: Colors.white,
                  fontSize: 20,
                  fontColor: Color.fromRGBO(40, 53, 85, 1),
                  onPressed: () {},
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
                  onPressed: () {
                    authCubit.googleSignIn();
                  },
                  height: 50,
                  content: "Увійти з Google",
                  icon: 'assets/Google_icon-icons.com_66793.png',
                ),
              ),
              SignWithCustomButton(
                content: 'Увійти з Facebook ',
                icon: 'assets/facebook_Icon.jpg',
                height: 50,
                onPressed: () {authCubit.facebookSignIn();},
                backColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    return Color.fromRGBO(58, 85, 159, 1);
                  },
                ),
                fontColor: Colors.white,
              )
            ]),
          ]),
        ),
      ),
    );
  }
}
