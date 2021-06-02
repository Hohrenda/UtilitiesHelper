import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:utilities_helper/cubit/auth/auth_cubit.dart';
import 'package:utilities_helper/cubit/auth/auth_state.dart';
import 'package:utilities_helper/utils/navigation_utils.dart';
import 'package:utilities_helper/screens/home/home_screen.dart';
import 'package:utilities_helper/custom_widgets/custom_logo.dart';
import 'package:utilities_helper/custom_widgets/custom_button.dart';
import 'package:utilities_helper/custom_widgets/custom_text_input.dart';

class RegistrationPage extends StatefulWidget
{
  @override
  _RegistationPageState createState() => _RegistationPageState();
}

class _RegistationPageState extends State<RegistrationPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(206, 212, 249, 1),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 36, vertical: 24),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CustomLogo(underTitle: 'Реєстрацiя'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: CustomTextInput(title: 'Логiн'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 17),
              child: CustomTextInput(title: 'Пароль'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 17),
              child: CustomTextInput(title: 'Повторiть пароль'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 95),
              child: CustomButton(
                  width: 330,
                  height: 65,
                  content: 'Зареєструватися',
                  fontSize: 36,
                  fontColor: Colors.white,
                  color: Color.fromRGBO(74, 84, 143, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }

}