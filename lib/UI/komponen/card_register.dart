import 'package:applikasi_keuangan/global/variable.dart';
import 'package:flutter/material.dart';

class CardRegister extends StatelessWidget {
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
          customTextFormField(
              Icons.person, "Alamat Email", TextInputType.emailAddress, false),
          SizedBox(
            height: 8,
          ),
          customTextFormField(Icons.phone_android_sharp, "Nomor ponsel",
              TextInputType.number, false),
          SizedBox(
            height: 8,
          ),
          customTextFormField(Icons.lock_open, "Kata Sandi",
              TextInputType.visiblePassword, true),
          SizedBox(
            height: 8,
          ),
          customTextFormField(Icons.lock_open, "Ulangi Kata Sandi",
              TextInputType.visiblePassword, true),
        ],
      ),
    );
  }
}
