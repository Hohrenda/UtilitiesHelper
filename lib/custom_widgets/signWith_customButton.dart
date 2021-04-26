import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignWithCustomButton extends StatelessWidget {
  final String content;
  final String icon;
  final double height;

  SignWithCustomButton({
    @required this.content,
    @required this.icon,
    @required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: SizedBox(
        height: this.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image(
              image: AssetImage(icon),
            ),
            Text(
              content,
              style:
                  TextStyle(fontSize: 26, color: Color.fromRGBO(40, 53, 85, 1)),
            ),
          ],
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
            return Colors.white;
          },
        ),
      ),
    );
  }
}
