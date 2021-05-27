import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';

class CustomLogo extends StatelessWidget {
  final String underTitle;

  CustomLogo({
    this.underTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Stack(
        children: <Widget>[
          Text(
            "Utilities",
            textAlign: TextAlign.center,
            style: GoogleFonts.rancho(
                fontSize: 48, color: Color.fromRGBO(74, 84, 143, 1)),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 40.0,
            ),
            child: Text(
              " Helper",
              textAlign: TextAlign.center,
              style: GoogleFonts.rancho(
                  fontSize: 48, color: Color.fromRGBO(40, 53, 85, 1)),
            ),
          ),
        ],
      ),
      Text(
        underTitle,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 48.0,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(40, 53, 85, 1)
        ),
      ),
    ]);
  }
}
