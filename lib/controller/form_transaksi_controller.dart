import 'package:applikasi_keuangan/api/transaksi.dart';
import 'package:applikasi_keuangan/global/session.dart';
import 'package:applikasi_keuangan/global/variable.dart';
import 'package:applikasi_keuangan/model/Account.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormTransaksiController extends GetxController
    with SingleGetTickerProviderMixin {
  List<Tab> myTabs = [
    Tab(
      text: "Pemasukan",
    ),
    Tab(
      text: "Pengeluaran",
    )
  ];
  TabController? tabController;
  int index = 0;
  List<Account> listAccount = [];
  TextEditingController voucherController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();
  TextEditingController pemasukanController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController pengeluaranController = TextEditingController();
  Account? selectedAccount;
  var isLoading = true;

  void controllerListener() {
    index = tabController!.index;
    update();
  }

  Future loadDataAccount() async {
    await ApiListAccount.futureApiListAccount().then((value) {
      if (value.isSucces()) {
        isLoading = false;
        listAccount = value.data ?? [];
      }
    });
    update();
  }

  Future submitTransaksi() async {
    await ApiListAccount.futureApiCreateTransaction(
            accountId: selectedAccount!.id,
            date: dateController.text,
            debit: index == 0 ? 0 : int.parse(pengeluaranController.text),
            description: deskripsiController.text,
            invoiceNumber: voucherController.text,
            kredit: index == 1 ? 0 : int.parse(pemasukanController.text),
            token: Session().getToken())
        .then((value) {
      if (value.isSuccess()) {
        Get.defaultDialog(
            barrierDismissible: false,
            title: "Login",
            middleText: "${value.message}",
            confirm: ElevatedButton(
                onPressed: () {
                  Get.back();
                  Get.back();
                },
                child: Txt(
                  "OKE",
                  style: CustomStyle.txtStyle.clone()..fontSize(12),
                )));
      } else {
        Get.defaultDialog(
          title: "Submit Transaksi",
          middleText: "${value.message}",
        );
      }
    });
    update();
  }

  @override
  void onInit() {
    tabController = TabController(length: myTabs.length, vsync: this);
    tabController!.addListener(controllerListener);
    loadDataAccount();
    super.onInit();
  }

  @override
  void onClose() {
    tabController!.dispose();
    super.onClose();
  }
}
