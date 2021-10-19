import 'package:applikasi_keuangan/global/variable.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';

class CardLogin extends StatelessWidget {
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
      margin: EdgeInsets.only(left: 32, right: 32),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Txt("Selamat Datang",
              style: CustomStyle.txtStyle.clone()
                ..fontSize(16)
                ..textColor(Colors.black)
                ..fontFamily("Montserrat")
                ..bold()
                ..alignment.center()),
          SizedBox(
            height: 16,
          ),
          customTextFormField(
              Icons.person, "Alamat Email", TextInputType.emailAddress, false),
          SizedBox(
            height: 8,
          ),
          customTextFormField(Icons.lock_open, "Kata Sandi",
              TextInputType.visiblePassword, true),
          SizedBox(
            height: 16,
          ),
          Txt("Lupa kata sandi?",
              style: CustomStyle.txtStyle.clone()
                ..fontSize(14)
                ..textColor(txtBlueColor)
                ..bold()
                ..fontFamily("Montserrat")
                ..alignment.centerRight()),
        ],
      ),
    );
  }
}
