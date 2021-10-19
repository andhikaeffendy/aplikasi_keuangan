import 'package:applikasi_keuangan/UI/komponen/card_login.dart';
import 'package:applikasi_keuangan/global/variable.dart';
import 'package:applikasi_keuangan/routes/routes.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () =>
                Navigator.of(context).pushNamed(RouteGenerator.registerPage),
            child: Container(
              child: Center(
                child: Txt(
                  "DAFTAR",
                  style: CustomStyle.txtStyle.clone()
                    ..textAlign.center()
                    ..fontSize(14)
                    ..fontFamily("Comfortaa")
                    ..padding(right: 16),
                ),
              ),
            ),
          )
        ],
        title: Txt(
          "Masuk",
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
              CardLogin(),
              SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(RouteGenerator.mainPage);
                },
                child: customButton("MASUK"),
              )
            ],
          )
        ],
      ),
    );
  }
}
