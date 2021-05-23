import 'package:flutter/material.dart';
import 'package:utilities_helper/cubit/auth/auth_cubit.dart';
import 'package:utilities_helper/cutom_widgets/utils_button.dart';
import 'package:utilities_helper/models/user_model.dart';
import 'package:utilities_helper/screens/auth/login_page.dart';
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
  final titles = <String>['Home', 'Messages', 'Profile'];
  final tabs = <Widget>[HomeTab(), MessagesTab(), ProfileTab()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(206, 212, 249, 1),
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: ClipRRect(
            child: Image.network(
              widget.currentUser.imageUrl,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              await AuthCubit().logOut();
              await NavigationUtils.toScreenRemoveUntil(context,
                  screen: LoginPage());
            },
          )
        ],
        title: Text(titles[currentIndex]),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: UtilsButton(
              Width: 120,
              Height: 120,
              Content: "Content",
              FontSize: 16,
              ButtonColor: Colors.white,
              FontColor: Colors.black,
              TextWeight: FontWeight.bold,
              ButtonRadius: BorderRadius.circular(17),
              ImageButton: 'assets/images/google_icon.png',
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ],
      ),
    );
  }
}
