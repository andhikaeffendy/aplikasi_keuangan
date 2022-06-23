import 'package:applikasi_keuangan/UI/komponen/menu.dart';
import 'package:applikasi_keuangan/UI/layout/beranda.dart';
import 'package:applikasi_keuangan/UI/layout/laporan_keuangan.dart';
import 'package:applikasi_keuangan/UI/layout/profile.dart';
import 'package:applikasi_keuangan/UI/layout/transaksi.dart';
import 'package:applikasi_keuangan/controller/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MenuController>(
      init: MenuController(),
      builder: (controller) {
        return Scaffold(
            bottomNavigationBar: BottomAppBar(
              child: MenuItem(),
            ),
            body: IndexedStack(
              index: controller.selectedIndex,
              children: [BerandaPage(), TransaksiPage(), ProfilePage()],
            ));
      },
    );
  }
}
