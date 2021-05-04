import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Logo extends StatelessWidget {
  final String LogoString;

  Logo({
    @required this.LogoString,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            'Utilities',
            style: GoogleFonts.rancho(
                fontSize: 48, color: Color.fromRGBO(74, 84, 143, 1)),
          ),
          Text(
            'Helper',
            style: GoogleFonts.rancho(
                fontSize: 48, color: Color.fromRGBO(40, 53, 85, 1)),
          ),
          Text(LogoString,
              style: GoogleFonts.roboto(
                  fontSize: 53,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(40, 53, 85, 1)))
        ],
      ),
    );
  }
}