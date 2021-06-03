import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:utilities_helper/models/user_model.dart';

createNameDialog(BuildContext context, UserModel currentUser){
  TextEditingController customController = TextEditingController();

  return showDialog(context: context, builder: (context){
    return AlertDialog(
      title: Text('Ваше iм\'я'),
      content: TextField(
        controller: customController,
      ),
      actions: <Widget>[
        MaterialButton(
            elevation: 5.0,
            child: Text('Скасувати', style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.bold)),),
            onPressed: () {
              Navigator.of(context).pop();
            }
        ),
        MaterialButton(
            elevation: 5.0,
            child: Text('Пiдтвердити', style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color: Color.fromRGBO(74, 84, 143, 1.0),
                    fontSize: 14,
                    fontWeight: FontWeight.bold)),),
            onPressed: () {
              Navigator.of(context).pop(customController.text.toString());
            }
            )
      ],
    );
  });
}