import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final double Width, Height;
  final String Content;
  final double FontSize;
  final Color ButtonColor;
  final Color FontColor;
  final FontWeight TextWeight;
  final BorderRadius ButtonRadius;

  CustomButton({
    @required this.Width,
    @required this.Height,
    @required this.Content,
    @required this.FontSize,
    @required this.ButtonColor,
    @required this.FontColor,
    @required this.TextWeight,
    @required this.ButtonRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        borderRadius: ButtonRadius,
        color: ButtonColor,
        child: SizedBox(
          width: Width,
          child: MaterialButton(
            height: Height,
            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
            onPressed: () {},
            child: Text(
              Content,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  color: FontColor, fontWeight: TextWeight, fontSize: FontSize),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButtonWithImage extends StatelessWidget {
  final double Width, Height;
  final String Content;
  final double FontSize;
  final Color ButtonColor;
  final Color FontColor;
  final FontWeight TextWeight;
  final BorderRadius ButtonRadius;
  final String ImageButton;

  CustomButtonWithImage({
    @required this.Width,
    @required this.Height,
    @required this.Content,
    @required this.FontSize,
    @required this.ButtonColor,
    @required this.FontColor,
    @required this.TextWeight,
    @required this.ButtonRadius,
    @required this.ImageButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        borderRadius: ButtonRadius,
        color: ButtonColor,
        child: SizedBox(
          width: Width,
          child: MaterialButton(
            height: Height,
            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
            onPressed: () {},
            child: Row(
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
