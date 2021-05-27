import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextInput extends StatelessWidget {
  final String title;
  final TextEditingController textEditingController;

  CustomTextInput({
    @required this.title,
    @required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: GoogleFonts.roboto(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              textStyle: TextStyle(color: Color.fromRGBO(40, 53, 85, 1))),
        ),
        Padding(padding: EdgeInsets.fromLTRB(500, 7, 0, 0)),
        Material(
          borderRadius: BorderRadius.circular(16),
          elevation: 12,
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            ),
            obscureText: false,
          ),
        )
      ],
    );
  }
}
