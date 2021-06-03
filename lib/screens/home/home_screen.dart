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
  final tabs = <Widget>[
    ProfileTab(),
    HomeTab(),
    MessagesTab(),
  ];
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(104.0),
        child: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 30.0, right: 20, left: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        if (widget.currentUser.imageUrl.isNotEmpty)
                          ClipRRect(
                            child: Image.network(
                              widget.currentUser.imageUrl,
                              scale: 1.5,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(90)),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            widget.currentUser.name,
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  color: Color.fromRGBO(74, 84, 143, 1.0),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                        )
                      ]),
                  IconButton(
                    iconSize: 50.0,
                    icon: Image.asset(
                      'assets/exit_icon.png',
                      color: Color.fromRGBO(74, 84, 143, 1.0),
                    ),
                    onPressed: () async {
                      await AuthCubit().googleLogOut();
                      await NavigationUtils.toScreenRemoveUntil(context,
                          screen: AuthScreen());
                    },
                  ),
                ]),
          ),
        ),
      ),
      body: tabs[currentIndex],
    );
  }
}
