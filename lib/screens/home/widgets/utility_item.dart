import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UtilityItem extends StatefulWidget {
  final String title;
  final String imageAsset;
  final bool isNotifyOn;
  final VoidCallback onTap;

  UtilityItem({
    @required this.title,
    @required this.imageAsset,
    @required this.isNotifyOn,
    @required this.onTap,
  });

  @override
  _UtilityItemState createState() => _UtilityItemState();
}

class _UtilityItemState extends State<UtilityItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        InkWell(
          onTap: () {
            widget.onTap();
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 8),
                  )
                ]),
            width: 120,
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset(widget.imageAsset),
                Text(
                  widget.title,
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ),
        if (widget.isNotifyOn)
          Positioned(
            left: 104,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Color.fromRGBO(74, 84, 143, 1),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          )
      ],
    );
  }
}
