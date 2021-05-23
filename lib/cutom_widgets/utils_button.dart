import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UtilsButton extends StatelessWidget {
  final double Width, Height;
  final String Content;
  final double FontSize;
  final Color ButtonColor;
  final Color FontColor;
  final FontWeight TextWeight;
  final BorderRadius ButtonRadius;
  final String ImageButton;
  final VoidCallback onPressed;

  UtilsButton({
    @required this.Width,
    @required this.Height,
    @required this.Content,
    @required this.FontSize,
    @required this.ButtonColor,
    @required this.FontColor,
    @required this.TextWeight,
    @required this.ButtonRadius,
    @required this.ImageButton,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        elevation: 18,
        borderRadius: ButtonRadius,
        color: ButtonColor,
        child: SizedBox(
          width: Width,
          child: MaterialButton(
            height: Height,
            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
            onPressed: onPressed,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Image(image: AssetImage(ImageButton),),
                ),
                Text(
                  Content,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                      color: FontColor,
                      fontWeight: TextWeight,
                      fontSize: FontSize),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
