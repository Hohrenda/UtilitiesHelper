import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileUtility extends StatefulWidget{
  final String imageAsset;
  final String paymentInfo;
  final String vendorInfo;
  final VoidCallback VendorPressed;
  final VoidCallback PaymentInfoPressed;
  final bool isDebt;


  ProfileUtility({
    @required this.imageAsset,
    @required this.paymentInfo,
    @required this.VendorPressed,
    @required this.PaymentInfoPressed,
    @required this.isDebt,
    this.vendorInfo,
  });

  @override
  _ProfileUtility createState() => _ProfileUtility();
}

class _ProfileUtility extends State<ProfileUtility>{
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color: Colors.white,
                  boxShadow: [BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 8),
                  )]
              ),
              width: 75,
              height: 75,
              child: Image.asset(widget.imageAsset,scale: 1.5,),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                if(widget.isDebt)
                Padding(
                  padding: const EdgeInsets.fromLTRB(23, 0, 20, 0),
                  child: InkWell(
                    onTap: widget.PaymentInfoPressed,
                    child: Text(
                      widget.paymentInfo,
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                if(!widget.isDebt)Padding(
                  padding: const EdgeInsets.fromLTRB(23, 0, 20, 0),
                  child: Text(
                    widget.paymentInfo,
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(74, 84, 143, 1),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(23, 5, 0, 0),
                  child: InkWell(
                    onTap: widget.VendorPressed,
                    child: Text(
                      widget.vendorInfo ?? 'Постачальник >',
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(106, 106, 106, 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}