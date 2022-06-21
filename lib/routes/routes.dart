import 'package:applikasi_keuangan/UI/layout/bottom_menu.dart';
import 'package:applikasi_keuangan/UI/layout/form_transaksi.dart';
import 'package:applikasi_keuangan/UI/layout/login.dart';
import 'package:applikasi_keuangan/UI/layout/register.dart';
import 'package:get/route_manager.dart';

class Routes {
  static const String loginPage = '/loginPage';
  static const String registerPage = '/registerPage';
  static const String mainPage = '/';
  static const String addTransaksi = '/addTransaksi';

  static final routes = [
    GetPage(name: loginPage, page: () => LoginPage()),
    GetPage(name: registerPage, page: () => RegisterPage()),
    GetPage(name: mainPage, page: () => BottomMenuPage()),
    GetPage(name: addTransaksi, page: () => FormTransaksi()),
  ];
}
