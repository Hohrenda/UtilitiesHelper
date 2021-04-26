import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String content;
  final double width, height;
  final double fontSize;
  final Color color;
  final Color fontColor;



  CustomButton({
    @required this.content,
    @required this.height,
    @required this.width,
    this.fontSize,
    this.color,
    this.fontColor,

  });



  @override
  Widget build(BuildContext context) {
    return Center(child: ElevatedButton(
      onPressed: () {},
      child: SizedBox(
        width: this.width,
        height: this.height,
        child: Center(
          child: Text(
            this.content,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize ?? 31,
              color: fontColor ?? Colors.white,
              fontWeight: FontWeight.bold,

            ),
          ),
        ),
      ),
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(10),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            return color ?? Color.fromRGBO(74, 84, 143, 1);
          },
        ),
      ),
    ));
  }
}
