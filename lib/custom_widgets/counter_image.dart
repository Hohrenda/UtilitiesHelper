import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class CounterImage extends StatelessWidget {
  final double widthForm;
  final double heightForm;

  const CounterImage(
      {Key key, @required this.heightForm, @required this.widthForm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(244, 251, 254, 1),
        borderRadius: BorderRadius.circular(15),
      ),
      width: widthForm,
      height: heightForm,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right:33.0),
            child: Image.asset('assets/plus.png'),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Фото',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 36,
                    color: Color.fromRGBO(170, 149, 221, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'лічильника',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 36,
                    color: Color.fromRGBO(170, 149, 221, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
