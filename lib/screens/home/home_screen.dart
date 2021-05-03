import 'package:flutter/material.dart';
import 'package:utilities_helper/cubit/auth/auth_cubit.dart';
import 'package:utilities_helper/models/user_model.dart';
import 'package:utilities_helper/screens/auth/auth_screen.dart';
import 'package:utilities_helper/utils/navigation_utils.dart';

class HomeScreen extends StatefulWidget {
  final UserModel currentUser;
  const HomeScreen({Key key, @required this.currentUser}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              await AuthCubit().googleLogOut();
              await NavigationUtils.toScreenRemoveUntil(context,
                  screen: AuthScreen());
            },
          )
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          if (widget.currentUser.imageUrl.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(90)),
              child: Image.network(widget.currentUser.imageUrl),
            ),
          Text(widget.currentUser.name),
        ]),
      ),
    );
  }
}
