import 'package:applikasi_keuangan/api/login.dart';
import 'package:applikasi_keuangan/global/session.dart';
import 'package:applikasi_keuangan/global/variable.dart';
import 'package:applikasi_keuangan/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  void sessionLogout(BuildContext context) async {
    await ApiLogin.futureApiLogout(Session().getToken()).then((value) {
      print("token: ${Session().getToken()}");
      if (value.isSuccess()) {
        Session().destroySession(context);
        startNewPage(context, Routes.loginPage);
      } else {
        print(value.message);
      }
    });
    update();
  }
}
