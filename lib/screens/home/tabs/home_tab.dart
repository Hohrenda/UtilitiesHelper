import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:utilities_helper/screens/home/widgets/utility_item.dart';
import 'package:utilities_helper/screens/payment/payment_screen.dart';
import 'package:utilities_helper/screens/splash/splash_screen.dart';
import 'package:utilities_helper/utils/navigation_utils.dart';

class HomeTab extends StatefulWidget {

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(206, 212, 249, 1),
      child: Column(
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
                  NavigationUtils.toScreenRemoveUntil(context,
                      screen: PayScreen(title: 'Квартплата',));
                },
              ),
              UtilityItem(
                title: 'Сміття',
                imageAsset: 'assets/garbage.png',
                isNotifyOn: false,
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
              ),
              UtilityItem(
                title: 'Опалення',
                imageAsset: 'assets/heat.png',
                isNotifyOn: false,
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
              ),
              UtilityItem(
                title: 'Вода',
                imageAsset: 'assets/water.png',
                isNotifyOn: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
