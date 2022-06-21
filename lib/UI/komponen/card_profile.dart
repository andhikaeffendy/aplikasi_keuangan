import 'package:applikasi_keuangan/global/variable.dart';
import 'package:flutter/material.dart';

class CardProfile extends StatefulWidget {
  @override
  _CardProfileState createState() => _CardProfileState();
}

class _CardProfileState extends State<CardProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: Offset(0.0, 3.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: setWidth(32)),
      padding: EdgeInsets.symmetric(
          horizontal: setWidth(16), vertical: setHeight(32)),
      child: Column(
        children: [
          textFormFieldCustom("Nama Akun", "Bumdes"),
          SizedBox(
            height: setHeight(16),
          ),
          textFormFieldCustom("Email", currentUser.email!),
          SizedBox(
            height: setHeight(16),
          ),
          textFormFieldCustom("Nomor Ponsel", "+6282198113362"),
          SizedBox(
            height: setHeight(16),
          ),
          textFormFieldCustom("Password", "andhika123"),
          SizedBox(
            height: setHeight(16),
          ),
        ],
      ),
    );
  }
}
