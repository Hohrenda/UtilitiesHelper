import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:utilities_helper/cubit/auth/auth_cubit.dart';
import 'package:utilities_helper/models/user_model.dart';
import 'package:utilities_helper/screens/auth/auth_screen.dart';
import 'package:utilities_helper/screens/home/widgets/utility_item.dart';
import 'package:utilities_helper/screens/payment/payment_screen.dart';
import 'package:utilities_helper/screens/payment_screens/menu_payment_screen.dart';
import 'package:utilities_helper/screens/payment_screens/payment_form_screen.dart';
import 'package:utilities_helper/screens/splash/splash_screen.dart';
import 'package:utilities_helper/utils/navigation_utils.dart';

class HomeTab extends StatefulWidget {
  final UserModel currentUser;

  const HomeTab({Key key, @required this.currentUser}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(206, 212, 249, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              UtilityItem(
                title: 'Квартплата',
                imageAsset: 'assets/flat.png',
                isNotifyOn: true,
                onTap: () {
                  NavigationUtils.toScreen(context,
                      screen: PaymentForm(
                        header: 'Квартплата',
                        address: "вул. Цілиноградська, кв. 509",
                        date: "03.21",
                        sum: "900",));
                },
              ),
              UtilityItem(
                title: 'Сміття',
                imageAsset: 'assets/garbage.png',
                isNotifyOn: false,
                  onTap: () {
                    NavigationUtils.toScreen(context,
                        screen: PaymentForm(header: 'Сміття'));
                  }
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              UtilityItem(
                title: 'Електрика',
                imageAsset: 'assets/electro.png',
                isNotifyOn: false,
                  onTap: () {
                    NavigationUtils.toScreen(context,
                        screen: MenuPaymentScreen(header: 'Електрика'));
                  }
              ),
              UtilityItem(
                title: 'Опалення',
                imageAsset: 'assets/heat.png',
                isNotifyOn: false,
                  onTap: () {
                    NavigationUtils.toScreen(context,
                        screen: PaymentForm(header: 'Опалення'));
                  }
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              UtilityItem(
                title: 'Газ',
                imageAsset: 'assets/gas.png',
                isNotifyOn: false,
                  onTap: () {
                    NavigationUtils.toScreen(context,
                        screen: MenuPaymentScreen(header: 'Газ'));
                  }
              ),
              UtilityItem(
                title: 'Вода',
                imageAsset: 'assets/water.png',
                isNotifyOn: false,
                  onTap: () {
                    NavigationUtils.toScreen(context,
                        screen: MenuPaymentScreen(header: 'Вода'));
                  }
              ),
            ],
          ),
        ],
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
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
    );
  }
}
