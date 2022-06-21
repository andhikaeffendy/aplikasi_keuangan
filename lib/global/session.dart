import 'dart:convert';

import 'package:applikasi_keuangan/global/variable.dart';
import 'package:applikasi_keuangan/model/user.dart';
import 'package:applikasi_keuangan/routes/routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Session extends GetxController {
  var sessionUser = "ApiSessionUser";
  final GetStorage box = GetStorage();
  var isLogin = false;

  @override
  void onInit() async {
    super.onInit();
    await GetStorage.init();
    checkLogin();
  }

  void loginSession() async {
    await GetStorage.init();
    box.write(sessionUser, json.encode(currentUser.toJson()));
    update();
  }

  void destroySession(context) async {
    await GetStorage.init();
    box.erase();
    if (box.read(sessionUser) == null) {
      nextPage(context, Routes.loginPage);
    }
    update();
  }

  String getToken() {
    if (box.read(sessionUser) != null) {
      return currentUser.idToken!;
    } else {
      return "Not Valid";
    }
  }

  void checkLogin() async {
    await GetStorage.init();
    print("data : ${box.read(sessionUser)}");
    if (box.read(sessionUser) != null) {
      isLogin = true;
      loadSession();
      update();
    } else {
      print("kosong");
      isLogin = false;
      update();
    }
    update();
  }

  Future loadSession() async {
    if (box.read(sessionUser) != null) {
      currentUser = User.fromJson(json.decode(box.read(sessionUser)));
      print(currentUser);
    }
    update();
  }
}
