import 'package:applikasi_keuangan/global/variable.dart';
import 'package:applikasi_keuangan/model/transaksi.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LaporanView extends StatefulWidget {
  final int id;
  final Transaksi transaksi;

  LaporanView({required this.id, required this.transaksi});

  @override
  _LaporanViewState createState() => _LaporanViewState();
}

class _LaporanViewState extends State<LaporanView> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Icon(
          FontAwesomeIcons.moneyBills,
          size: 14,
          color: Colors.white,
        ),
      ),
      title: Txt("${widget.transaksi.description}"),
      subtitle: Row(
        children: [
          Txt("Hari ini ."),
          Txt("${widget.transaksi.account!.name}"),
        ],
      ),
      trailing: Txt(
        "Rp ${widget.transaksi.amountCredit}",
        style: CustomStyle.txtStyle.clone()..textColor(Color(0xFFEAC95B)),
      ),
    );
    // return Column(
    //   children: [
    //     LaporanCard(title: "Laba rugi", harga: "Rp. 600.000"),
    //     Container(
    //       height: 8,
    //       color: lineColor,
    //     ),
    //     LaporanCard(title: "Jurnal Umum", harga: "Rp. 6000.000"),
    //     Container(
    //       height: 8,
    //       color: lineColor,
    //     ),
    //     LaporanCard(title: "Kas", harga: "Rp. 200.000"),
    //     Container(
    //       height: 8,
    //       color: lineColor,
    //     ),
    //     LaporanCard(title: "Pendapatan", harga: "Rp. 600.000"),
    //     Container(
    //       height: 8,
    //       color: lineColor,
    //     ),
    //     LaporanCard(title: "Tagihan Pelanggan", harga: "Rp. 1.200.000"),
    //     Container(
    //       height: 8,
    //       color: lineColor,
    //     ),
    //   ],
    // );
  }
}
