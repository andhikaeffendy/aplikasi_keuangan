import 'package:applikasi_keuangan/api/transaksi.dart';
import 'package:applikasi_keuangan/global/session.dart';
import 'package:applikasi_keuangan/model/transaksi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BerandaController extends GetxController with SingleGetTickerProviderMixin {
  TabController? tabController;
  List<Transaksi> lisTransaksi = <Transaksi>[];

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    getTransactionToday();
    super.onInit();
  }

  void getTransactionToday() async {
    await ApiListTransaction.futureApiListTransaction(Session().getToken()).then((value) {
      if (value.isSucces()) {
        lisTransaksi = value.data ?? [];
      }
    });
    update();
  }
}
