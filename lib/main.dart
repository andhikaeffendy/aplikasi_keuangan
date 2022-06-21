// ignore_for_file: must_be_immutable

import 'package:applikasi_keuangan/global/session.dart';
import 'package:applikasi_keuangan/global/variable.dart';
import 'package:applikasi_keuangan/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Session().loadSession();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Session>(
      init: Session(),
      builder: (controller) => ScreenUtilInit(
        designSize: sizeScreen,
        builder: () => GetMaterialApp(
          title: 'Aplikasi Keuangan',
          debugShowCheckedModeBanner: false,
          initialRoute: box.read(Session().sessionUser) == null
              ? Routes.loginPage
              : Routes.mainPage,
          getPages: Routes.routes,
        ),
      ),
    );
  }
}
