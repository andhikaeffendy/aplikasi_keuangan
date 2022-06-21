import 'package:applikasi_keuangan/global/variable.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';

class CardLogin extends StatelessWidget {
  final TextEditingController? email;
  final TextEditingController? password;
  CardLogin({this.email, this.password});

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Txt("Selamat Datang",
              style: CustomStyle.txtStyle.clone()
                ..fontSize(setFont(16))
                ..textColor(Colors.black)
                ..fontFamily("Montserrat")
                ..bold()
                ..alignment.center()),
          SizedBox(
            height: setHeight(16),
          ),
          customTextFormField(Icons.person, "Alamat Email",
              TextInputType.emailAddress, false, email!),
          SizedBox(
            height: setHeight(8),
          ),
          customTextFormField(Icons.lock_open, "Kata Sandi",
              TextInputType.visiblePassword, true, password!),
          SizedBox(
            height: setHeight(16),
          ),
          Txt("Lupa kata sandi?",
              style: CustomStyle.txtStyle.clone()
                ..fontSize(setFont(14))
                ..textColor(txtBlueColor)
                ..bold()
                ..fontFamily("Montserrat")
                ..alignment.centerRight()),
        ],
      ),
    );
  }
}
