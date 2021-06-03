import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:utilities_helper/cubit/auth/auth_cubit.dart';
import 'package:utilities_helper/models/user_model.dart';
import 'package:utilities_helper/screens/auth/auth_screen.dart';
import 'package:utilities_helper/screens/home/tabs/home_tab.dart';
import 'package:utilities_helper/screens/home/tabs/messages_tab.dart';
import 'package:utilities_helper/screens/home/tabs/profile_tab.dart';
import 'package:utilities_helper/utils/navigation_utils.dart';

class HomeScreen extends StatefulWidget {
  final UserModel currentUser;

  const HomeScreen({Key key, @required this.currentUser}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final titles = <String>['Profile', 'Home', 'Message'];
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final tabs = <Widget>[
      ProfileTab(currentUser: widget.currentUser),
      HomeTab(currentUser: widget.currentUser),
      MessagesTab(),
    ];
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: (<BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 8.0,
                offset: Offset(0.0, 0.75))
          ]),
        ),
        child: BottomNavigationBar(
          elevation: 7.0,
          unselectedItemColor: Color.fromRGBO(106, 106, 106, 0.6),
          selectedItemColor: Color.fromRGBO(74, 84, 143, 1),
          type: BottomNavigationBarType.shifting,
          iconSize: 35.0,
          currentIndex: currentIndex,
          onTap: (index) => setState(() {
            currentIndex = index;
          }),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Message'),
          ],
        ),
      ),
      body: tabs[currentIndex],
    );
  }
}
