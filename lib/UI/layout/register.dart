import 'package:applikasi_keuangan/UI/komponen/card_register.dart';
import 'package:applikasi_keuangan/global/variable.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Txt(
          "Daftar",
          style: CustomStyle.txtStyle.clone()..bold(),
        ),
        backgroundColor: appBarColor,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          customBackground(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customHeader(),
              SizedBox(
                height: 16,
              ),
              CardRegister(),
              SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () {
                  print("dor");
                },
                child: customButton("DAFTAR"),
              )
            ],
          )
        ],
      ),
    );
  }
}
