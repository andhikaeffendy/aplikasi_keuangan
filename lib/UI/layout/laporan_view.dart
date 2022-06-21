import 'package:applikasi_keuangan/UI/komponen/laporan_card.dart';
import 'package:applikasi_keuangan/global/variable.dart';
import 'package:flutter/material.dart';

class LaporanView extends StatefulWidget {
  final int id;

  LaporanView({required this.id});

  @override
  _LaporanViewState createState() => _LaporanViewState();
}

class _LaporanViewState extends State<LaporanView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LaporanCard(title: "Laba rugi", harga: "Rp. 600.000"),
        Container(
          height: 8,
          color: lineColor,
        ),
        LaporanCard(title: "Jurnal Umum", harga: "Rp. 6000.000"),
        Container(
          height: 8,
          color: lineColor,
        ),
        LaporanCard(title: "Kas", harga: "Rp. 200.000"),
        Container(
          height: 8,
          color: lineColor,
        ),
        LaporanCard(title: "Pendapatan", harga: "Rp. 600.000"),
        Container(
          height: 8,
          color: lineColor,
        ),
        LaporanCard(title: "Tagihan Pelanggan", harga: "Rp. 1.200.000"),
        Container(
          height: 8,
          color: lineColor,
        ),
      ],
    );
  }
}
