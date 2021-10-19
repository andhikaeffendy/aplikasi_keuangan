import 'package:applikasi_keuangan/UI/layout/bottom_menu.dart';
import 'package:applikasi_keuangan/UI/layout/form_transaksi.dart';
import 'package:applikasi_keuangan/UI/layout/login.dart';
import 'package:applikasi_keuangan/UI/layout/register.dart';
import 'package:applikasi_keuangan/bloc/navigator_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGenerator {
  static const String loginPage = 'loginPage';
  static const String registerPage = 'registerPage';
  static const String mainPage = 'mainPage';
  static const String addTransaksi = 'addTransaksi';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(builder: (context) => LoginPage());
      case registerPage:
        return MaterialPageRoute(builder: (context) => RegisterPage());
      case mainPage:
        return MaterialPageRoute(
            builder: (context) => BlocProvider<NavigatorBlocBloc>(
                  create: (context) => NavigatorBlocBloc(),
                  child: BottomMenuPage(),
                ));
      case addTransaksi:
        return MaterialPageRoute(builder: (context) => FormTransaksi());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("Routes ${settings.name} is NOT DEFINED"),
                  ),
                ));
    }
  }
}
