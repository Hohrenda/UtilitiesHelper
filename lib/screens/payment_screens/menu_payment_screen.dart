import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:utilities_helper/custom_widgets/custom_button.dart';
import 'package:utilities_helper/models/user_model.dart';
import 'package:utilities_helper/screens/home/home_screen.dart';
import 'package:utilities_helper/screens/home/tabs/home_tab.dart';
import 'package:utilities_helper/utils/navigation_utils.dart';
import 'package:utilities_helper/screens/payment_screens/payment_form_screen.dart';
import 'package:utilities_helper/screens/payment_screens/counter_indicator_screen.dart';
class MenuPaymentScreen extends StatelessWidget {
  final String header;
  final UserModel currentUser;

  MenuPaymentScreen({@required this.header, @required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(206, 212, 249, 1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(104.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          centerTitle: true,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(
              top: 30.0,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  iconSize: 50.0,
                  icon: Image.asset(
                    'assets/arrow.png',
                    color: Color.fromRGBO(170, 149, 221,1),
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  header,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 36.0,
                      color: Color.fromRGBO(170, 149, 221, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:45.0, bottom: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: CustomButton(
                content: 'Ввести нові показання',
                height: 80,
                width: 330,
                color: Color.fromRGBO(74, 84, 143, 1),
                fontColor: Colors.white,
                fontSize: 24,
                onPressed: (){NavigationUtils.toScreen(context, screen: CounterIndicatorScreen(header: header+' показання'));},
              ),
            ),
            CustomButton(
              content: 'Сплатити',
              height: 80,
              width: 330,
              color: Color.fromRGBO(74, 84, 143, 1),
              fontColor: Colors.white,
              fontSize: 24,
              onPressed: (){NavigationUtils.toScreen(context, screen: PaymentForm(header: header+' сплата'));},
            )
          ],
        ),
      ),
    );
  }
}
