import 'package:applikasi_keuangan/api/login.dart';
import 'package:applikasi_keuangan/global/app_dialog.dart';
import 'package:applikasi_keuangan/global/session.dart';
import 'package:applikasi_keuangan/global/variable.dart';
import 'package:applikasi_keuangan/routes/routes.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GetStorage box = GetStorage();
  var getSession = Get.put(Session());
  bool isAuth = false;

  void checkLoginForm(BuildContext context) async {
    AppDialog.showCircular(context);
    await GetStorage.init();
    await ApiLogin.futureApiLogin(emailController.text, passwordController.text)
        .then((value) {
      AppDialog.closeCircular(context);
      if (value.isSuccess()) {
        currentUser = value.user!;
        getSession.loginSession();
        print("data : ${box.read(getSession.sessionUser)}");
        Get.defaultDialog(
            barrierDismissible: false,
            title: "Login",
            middleText: "${value.message}",
            confirm: ElevatedButton(
                onPressed: () {
                  startNewPage(context, Routes.mainPage);
                },
                child: Txt(
                  "OKE",
                  style: CustomStyle.txtStyle.clone()..fontSize(12),
                )));
      } else {
        Get.defaultDialog(
          title: "Login",
          middleText: "${value.message}",
        );
      }
    });
    update();
  }
}
