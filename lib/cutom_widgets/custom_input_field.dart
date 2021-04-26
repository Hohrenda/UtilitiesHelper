import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          style: TextStyle(fontSize: 24 , fontWeight: FontWeight.w500),
        ),
        Padding(padding: EdgeInsets.fromLTRB(500,7,0,0)),
        Material(
          borderRadius: BorderRadius.circular(16),
          elevation: 18,
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

