import 'package:applikasi_keuangan/UI/layout/laporan_view.dart';
import 'package:applikasi_keuangan/global/variable.dart';
import 'package:applikasi_keuangan/routes/routes.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';

class BerandaPage extends StatefulWidget {
  @override
  _BerandaPageState createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Laporan",
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
                Container(
                  constraints: BoxConstraints(maxHeight: 80, minHeight: 50),
                  child: TabBar(
                    controller: tabController,
                    labelColor: bgColor,
                    unselectedLabelColor: txtHintColor,
                    labelStyle: CustomStyle.textFormFieldStyle,
                    indicatorColor: Colors.transparent,
                    tabs: [
                      Txt("Hari ini"),
                      Txt("Minggu ini"),
                      Txt("Bulan ini"),
                    ],
                  ),
                ),
                Container(
                  height: 8,
                  color: lineColor,
                ),
                Expanded(
                    child: TabBarView(
                  controller: tabController,
                  children: [
                    LaporanView(id: 1),
                    LaporanView(id: 2),
                    LaporanView(id: 3),
                  ],
                ))
              ],
            ),
          ),
          Positioned(
              bottom: 16,
              right: 0,
              left: 0,
              child: GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushNamed(RouteGenerator.addTransaksi),
                  child: customButton("+ Tambah Transaksi")))
        ],
      ),
    );
  }
}
