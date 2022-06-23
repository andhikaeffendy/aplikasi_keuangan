import 'package:applikasi_keuangan/UI/layout/laporan_view.dart';
import 'package:applikasi_keuangan/controller/beranda_controller.dart';
import 'package:applikasi_keuangan/global/variable.dart';
import 'package:applikasi_keuangan/routes/routes.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BerandaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BerandaController>(
      init: BerandaController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.only(right: 16),
                child: Center(
                  child: Icon(
                    Icons.search,
                    size: 25,
                  ),
                ),
              ),
            )
          ],
          title: Txt(
            "SIAP BUMDES",
            style: CustomStyle.txtStyle.clone()..bold(),
          ),
          centerTitle: true,
          backgroundColor: appBarColor,
        ),
        body: Stack(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   constraints: BoxConstraints(maxHeight: 80, minHeight: 50),
                  //   child: TabBar(
                  //     controller: controller.tabController,
                  //     labelColor: bgColor,
                  //     unselectedLabelColor: txtHintColor,
                  //     labelStyle: CustomStyle.textFormFieldStyle,
                  //     indicatorColor: Colors.transparent,
                  //     tabs: [
                  //       Txt("Hari ini"),
                  //       Txt("Minggu ini"),
                  //       Txt("Bulan ini"),
                  //     ],
                  //   ),
                  // ),
                  Container(
                    height: 8,
                    color: lineColor,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    child: Txt(
                      "Transaksi Terbaru",
                      style: CustomStyle.txtStyle.clone()
                        ..bold()
                        ..fontSize(16)
                        ..textColor(Colors.black),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.lisTransaksi.length,
                        itemBuilder: (context, index) {
                          return LaporanView(
                            id: 1,
                            transaksi: controller.lisTransaksi[index],
                          );
                        }),
                    //     TabBarView(
                    //   controller: controller.tabController,
                    //   children: [
                    //     ,
                    //     LaporanView(id: 2),
                    //     LaporanView(id: 3),
                    //   ],
                    // ),
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 16,
                right: 0,
                left: 0,
                child: GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(Routes.addTransaksi),
                    child: customButton("+ Tambah Transaksi")))
          ],
        ),
      ),
    );
  }
}
