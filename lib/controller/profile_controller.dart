import 'package:applikasi_keuangan/api/account.dart';
import 'package:applikasi_keuangan/api/login.dart';
import 'package:applikasi_keuangan/global/session.dart';
import 'package:applikasi_keuangan/global/variable.dart';
import 'package:applikasi_keuangan/model/user.dart';
import 'package:applikasi_keuangan/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  User user = new User();

  @override
  void onInit() {
    getDetailProfile();
    super.onInit();
  }

  void sessionLogout(BuildContext context) async {
    await ApiLogin.futureApiLogout(Session().getToken()).then((value) {
      print("token: ${Session().getToken()}");
      if (value.isSuccess()) {
        Session().destroySession(context);
        startNewPage(context, Routes.loginPage);
      } else {
        Session().destroySession(context);
        print(value.message);
      }
    });
    update();
  }

  void getDetailProfile() async {
    String token = Session().getToken();
    // AppDialog.showCircular(Get.context!);
    await ApiProfile.futureApiProfile(token).then((value) {
      // AppDialog.closeCircular(Get.context!);
      if (value.isSuccess()) {
        user = value.user!;
        update();
      } else {
        Get.defaultDialog(
          title: "Profile",
          middleText: "${value.message}",
        );
      }
    });
  }
}
