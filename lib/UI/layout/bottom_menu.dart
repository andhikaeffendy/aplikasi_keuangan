import 'package:applikasi_keuangan/UI/komponen/menu.dart';
import 'package:applikasi_keuangan/UI/layout/beranda.dart';
import 'package:applikasi_keuangan/UI/layout/profile.dart';
import 'package:applikasi_keuangan/UI/layout/tagihan.dart';
import 'package:applikasi_keuangan/UI/layout/transaksi.dart';
import 'package:applikasi_keuangan/bloc/navigator_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomMenuPage extends StatefulWidget {
  @override
  _BottomMenuPageState createState() => _BottomMenuPageState();
}

class _BottomMenuPageState extends State<BottomMenuPage> {
  int selectedIndex = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NavigatorBlocBloc, NavigatorBlocState>(
        listener: (context, state) {
          pageController.jumpToPage(state.selectedPage);
        },
        child: Scaffold(
            bottomNavigationBar: BottomAppBar(
              child: MenuItem(),
            ),
            body: PageView(
              controller: pageController,
              children: [
                BerandaPage(),
                TransaksiPage(),
                TagihanPage(),
                ProfilePage()
              ],
            )));
  }
}
