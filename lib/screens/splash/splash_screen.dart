import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utilities_helper/cubit/auth/auth_cubit.dart';
import 'package:utilities_helper/cubit/auth/auth_state.dart';
import 'package:utilities_helper/screens/auth/login_page.dart';
import 'package:utilities_helper/screens/home/home_screen.dart';
import 'package:utilities_helper/utils/navigation_utils.dart';
import 'package:utilities_helper/utils/widget_utils.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final authCubit = AuthCubit();

  @override
  void initState() {
    authCubit.checkCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      bloc: authCubit,
      listener: (_, state) {
        if (!state.isLoading) {
          NavigationUtils.toScreenRemoveUntil(
            context,
            screen: state.currentUser != null
                ? HomeScreen(currentUser: state.currentUser)
                : LoginPage(),
          );
        }
      },
      child: Scaffold(body: WidgetUtils.showLoading()),
    );
  }
}
