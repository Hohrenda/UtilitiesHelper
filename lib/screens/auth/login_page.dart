import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:utilities_helper/cubit/auth/auth_cubit.dart';
import 'package:utilities_helper/cubit/auth/auth_state.dart';
import 'package:utilities_helper/utils/navigation_utils.dart';
import 'package:utilities_helper/screens/home/home_screen.dart';
import '../../cutom_widgets/custom_buttons.dart';
import '../../cutom_widgets/custom_input_field.dart';
import '../../cutom_widgets/custom_logo.dart';

class LoginPage extends StatefulWidget
{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit();

    return Scaffold(
      backgroundColor: Color.fromRGBO(206, 212, 249, 1),
      body: BlocListener<AuthCubit,AuthState>(
        bloc: authCubit,
        listener: (_, state) {
          if (!state.isLoading && state.currentUser != null) {
            NavigationUtils.toScreenRemoveUntil(context,
                screen: HomeScreen(currentUser: state.currentUser));
          }
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 36, vertical: 24),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Logo(LogoString: 'Авторизацiя'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: CustomTextInput(title: 'Логiн'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 17),
                child: CustomTextInput(title: 'Пароль'),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  child: Text(
                    'Забули пароль',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(40, 53, 85, 0.5),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomButton(
                    Width: 196,
                    Height: 65,
                    Content: 'Увiйти',
                    FontSize: 39,
                    FontColor: Colors.white,
                    ButtonColor: Color.fromRGBO(74, 84, 143, 1),
                    ButtonRadius: BorderRadius.circular(12),
                    TextWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 27),
                child: CustomButton(
                  Width: 330,
                  Height: 50,
                  Content: 'Реєстрація в Utilities Helper',
                  FontSize: 22,
                  FontColor: Color.fromRGBO(40, 53, 85, 1),
                  ButtonColor: Colors.white,
                  TextWeight: FontWeight.w500,
                  ButtonRadius: BorderRadius.circular(8),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      height: 1,
                      width: 141,
                      color: Colors.black,
                    ),
                    Text('Або'),
                    Container(
                      height: 1,
                      width: 141,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 9),
                child: CustomButtonWithImage(
                  Width: 330,
                  Height: 50,
                  Content: 'Увійти з Google',
                  FontSize: 26,
                  FontColor: Color.fromRGBO(40, 53, 85, 1),
                  ButtonColor: Colors.white,
                  TextWeight: FontWeight.w500,
                  ButtonRadius: BorderRadius.circular(10),
                  ImageButton: 'assets/images/google_icon.png',
                  onPressed: () => authCubit.googleSignIn(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 17),
                child: CustomButtonWithImage(
                  Width: 330,
                  Height: 50,
                  Content: 'Увійти з Facebook',
                  FontSize: 26,
                  FontColor: Colors.white,
                  ButtonColor:  Color.fromRGBO(58, 85, 159, 1),
                  TextWeight: FontWeight.w500,
                  ButtonRadius: BorderRadius.circular(10),
                  ImageButton: 'assets/images/google_icon.png',
                  onPressed: () => authCubit.facebookSignIn(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






