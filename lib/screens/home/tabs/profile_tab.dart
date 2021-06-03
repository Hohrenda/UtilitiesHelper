import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:utilities_helper/models/user_model.dart';
import 'package:utilities_helper/screens/home/widgets/profile_utility.dart';
import 'package:utilities_helper/screens/home/functions/popup.dart';

class ProfileTab extends StatefulWidget {
  final UserModel currentUser;

  const ProfileTab({Key key, @required this.currentUser}) : super(key: key);

  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(206, 212, 249, 1),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 40, 30, 20),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ClipRRect(
                      child: Image.network(
                        widget.currentUser.imageUrl,
                        scale: 0.7,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(90)),
                    ),
                    InkWell(
                      onTap: () {
                        createNameDialog(context,widget.currentUser);
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                              child: Text(
                                "Прізвище",
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        color: Color.fromRGBO(106, 106, 106, 1.0),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Text(
                              widget.currentUser.name,
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: Color.fromRGBO(74, 84, 143, 1.0),
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                              child: Text(
                                "Ім’я",
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        color: Color.fromRGBO(106, 106, 106, 1.0),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Text(
                              widget.currentUser.name,
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: Color.fromRGBO(74, 84, 143, 1.0),
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                              child: Text(
                                "По батькові",
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        color: Color.fromRGBO(106, 106, 106, 1.0),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Text(
                              widget.currentUser.name,
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: Color.fromRGBO(74, 84, 143, 1.0),
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Column(
              children: <Widget>[
                Divider(
                  height: 2,
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 6, 7),
                                child: Image.asset(
                                  'assets/address.png',
                                  scale: 2,
                                ),
                              ),
                              Text(
                                'Ваш дім:',
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        color:
                                            Color.fromRGBO(106, 106, 106, 1.0),
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold)),
                              )
                            ],
                          ),
                          Text(
                            "м. Харків, вул. Цілиноградська, кв. 509",
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: Color.fromRGBO(106, 106, 106, 1.0),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Image.asset(
                          'assets/choose_address.png',
                          scale: 2,
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 2,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(19.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                  child: ProfileUtility(
                    PaymentInfoPressed: () {},
                    VendorPressed: () {},
                    imageAsset: 'assets/electro.png',
                    paymentInfo: 'Сплачено  до 12.11.2021',
                    isDebt: false,
                  ),
                ),
                ProfileUtility(
                  PaymentInfoPressed: () {},
                  VendorPressed: () {},
                  imageAsset: 'assets/gas.png',
                  paymentInfo: 'Сплачено  до 12.11.2021',
                  isDebt: false,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                  child: ProfileUtility(
                    PaymentInfoPressed: () {},
                    VendorPressed: () {},
                    imageAsset: 'assets/water.png',
                    paymentInfo: 'Борг вiд 7.04.2021',
                    isDebt: true,
                  ),
                ),
                ProfileUtility(
                  PaymentInfoPressed: () {},
                  VendorPressed: () {},
                  imageAsset: 'assets/heat.png',
                  paymentInfo: 'Сплачено  до 12.11.2021',
                  isDebt: false,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                  child: ProfileUtility(
                    PaymentInfoPressed: () {},
                    VendorPressed: () {},
                    imageAsset: 'assets/flat.png',
                    paymentInfo: 'Сплачено  до 12.11.2021',
                    isDebt: false,
                  ),
                ),
                ProfileUtility(
                  PaymentInfoPressed: () {},
                  VendorPressed: () {},
                  imageAsset: 'assets/garbage.png',
                  paymentInfo: 'Сплачено  до 12.11.2021',
                  isDebt: false,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
