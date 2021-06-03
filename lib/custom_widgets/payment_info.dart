import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentInfo extends StatelessWidget {
  final String head;
  final String foot;
  final bool isInput;
  final double widthForm;
  final double heightForm;

  const PaymentInfo(
      {Key key,
      @required this.foot,
      @required this.head,
      @required this.isInput,
      @required this.widthForm,
      @required this.heightForm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(244, 251, 254, 1),
        borderRadius: BorderRadius.circular(5),
      ),
      width: widthForm,
      height: heightForm,
      child: Column(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  head,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 24,
                      color: Color.fromRGBO(170, 149, 221, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8,top:8.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: isInput
                  ? TextField(
                      decoration:
                          InputDecoration(labelText: 'Введіть суму для сплати'),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    )
                  : Text(
                      foot,
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(106, 106, 106, 1)),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
