import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay/pay.dart';
import 'package:utilities_helper/custom_widgets/custom_button.dart';
import 'package:utilities_helper/custom_widgets/payment_info.dart';
import 'package:utilities_helper/screens/payment/payment_screen.dart';
import 'package:utilities_helper/utils/navigation_utils.dart';
import 'package:pay_platform_interface/core/payment_item.dart';
import 'package:pay/pay.dart';

class PaymentForm extends StatefulWidget {
  final String header;
  final address;
  final date;
  final sum;

  const PaymentForm({Key key, @required this.header, this.address,this.date, this.sum}) : super(key: key);

  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  @override
  Widget build(BuildContext context) {
    List<String> mass = widget.header.split(' ');
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
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    if(mass.length > 1)
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
              padding: const EdgeInsets.only(top: 45.0),
              child: Column(
                children: <Widget>[
                  PaymentInfo(head: 'Адреса',
                    foot: widget.address ?? 'Example',
                    isInput: false,
                    widthForm: 330,
                    heightForm: 80,),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: PaymentInfo(foot: widget.date ??  'Місяць.Рік',
                      head: 'Період за який йде сплата',
                      isInput: false,
                      widthForm: 330,
                      heightForm: 80,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: PaymentInfo(foot: widget.sum ?? 'xxx.xx',
                      head: 'Сума для сплати',
                      isInput: false,
                      widthForm: 330,
                      heightForm: 80,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: PaymentInfo(foot: 'xxx.xx',
                      head: 'Сума для сплати',
                      isInput: true,
                      widthForm: 330,
                      heightForm: 105,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: buildBody(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
