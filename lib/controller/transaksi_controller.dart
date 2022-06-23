import 'package:applikasi_keuangan/api/transaksi.dart';
import 'package:applikasi_keuangan/global/session.dart';
import 'package:applikasi_keuangan/model/transaksi.dart';
import 'package:get/get.dart';

class TransaksiController extends GetxController {
  List<Transaksi> listTransaksi = [];
  var isLoading = true;

  Future loadDataTransaksi() async {
    await ApiListTransaction.futureApiListTransaction(Session().getToken()).then((value) {
      if (value.isSucces()) {
        listTransaksi = value.data ?? [];
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
  }
}
