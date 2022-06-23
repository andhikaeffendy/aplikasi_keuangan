import 'package:applikasi_keuangan/global/variable.dart';
import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LaporanKeuangan extends StatefulWidget {
  @override
  _LaporanKeuanganState createState() => _LaporanKeuanganState();
}

class _LaporanKeuanganState extends State<LaporanKeuangan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Txt(
          "Laporan Keuangan",
          style: CustomStyle.txtStyle.clone()..bold(),
        ),
        centerTitle: true,
        backgroundColor: appBarColor,
      ),
      body: Column(
        children: [
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.solidFileLines,
                size: 18,
              ),
              Txt(
                "Laporan Keuangan",
                style: CustomStyle.txtStyle.clone()
                  ..bold()
                  ..textColor(Colors.black),
              ),
            ],
          ),
          ListTile(
            title: Txt("Pemasukan"),
            trailing: Txt("Rp 120.000"),
          ),
          ListTile(
            title: Txt("Pengeluaran"),
            trailing: Txt("Rp 120.000"),
          ),
        ],
      ),
    );
  }
}
