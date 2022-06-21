import 'package:applikasi_keuangan/UI/komponen/card_login.dart';
import 'package:applikasi_keuangan/controller/login_controller.dart';
import 'package:applikasi_keuangan/global/variable.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          // actions: [
          //   GestureDetector(
          //     onTap: () => nextPage(context, Routes.registerPage),
          //     child: Container(
          //       child: Center(
          //         child: Txt(
          //           "DAFTAR",
          //           style: CustomStyle.txtStyle.clone()
          //             ..textAlign.center()
          //             ..fontSize(14)
          //             ..fontFamily("Comfortaa")
          //             ..padding(right: 16),
          //         ),
          //       ),
          //     ),
          //   )
          // ],
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
                CardLogin(
                  email: controller.emailController,
                  password: controller.passwordController,
                ),
                SizedBox(
                  height: 24,
                ),
                InkWell(
                  onTap: () {
                    controller.checkLoginForm(context);
                  },
                  child: customButton("MASUK"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
