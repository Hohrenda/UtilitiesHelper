import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:utilities_helper/custom_widgets/custom_button.dart';
import 'package:utilities_helper/custom_widgets/payment_info.dart';
import 'package:utilities_helper/custom_widgets/counter_image.dart';
import 'package:utilities_helper/screens/payment/payment_screen.dart';
import 'package:utilities_helper/screens/payment_screens/payment_form_screen.dart';
import 'package:utilities_helper/utils/navigation_utils.dart';

class CounterIndicatorScreen extends StatelessWidget {
  final String header;
  const CounterIndicatorScreen({Key key , @required this.header}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> mass = header.split(' ');
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
              top: 20.0,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  iconSize: 50.0,
                  icon: Image.asset(
                    'assets/arrow.png',
                    color: Color.fromRGBO(170, 149, 221, 1),
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
                Column(
                  children: <Widget>[
                    Text(
                      mass[0],
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 36.0,
                          color: Color.fromRGBO(170, 149, 221, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if(mass.length==2)
                      Text(
                        mass[1],
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 36.0,
                            color: Color.fromRGBO(170, 149, 221, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(
                  width: 40,
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top:45.0),
              child: Column(
                children: <Widget>[
                  PaymentInfo(head: 'Адреса', foot: 'Приклад адреси', isInput: false , widthForm: 330, heightForm: 80,),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: PaymentInfo(foot: 'Місяць.Рік', head: 'Період за який йде сплата', isInput: false, widthForm: 330, heightForm: 80,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: PaymentInfo(foot: 'Введіть показання лічильника', head: 'Показання лічильника', isInput: true , widthForm: 330, heightForm: 105,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:20.0),
                    child: CounterImage(heightForm: 200,widthForm:330),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:30.0),
                    child: CustomButton(content: 'Відправити', height: 70, width: 230, onPressed: (){NavigationUtils.toScreen(context, screen: PaymentForm(header: mass[0]+' сплата'));}),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
