import 'package:applikasi_keuangan/controller/transaksi_controller.dart';
import 'package:applikasi_keuangan/global/variable.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TransaksiPage extends StatefulWidget {
  @override
  _TransaksiPageState createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransaksiController>(
        init: TransaksiController(),
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: Txt(
                  "Riwayat Transaksi",
                  style: CustomStyle.txtStyle.clone()..bold(),
                ),
                backgroundColor: appBarColor,
                centerTitle: true,
              ),
              body: FutureBuilder(
                  future: controller.loadDataTransaksi(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.connectionState ==
                            ConnectionState.done &&
                        snapshot.hasData) {
                      controller.loadDataTransaksi();
                    }
                    return ListView.builder(
                        itemCount: controller.listTransaksi.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 2.0,
                            child: ListTile(
                              isThreeLine: true,
                              dense: true,
                              leading: Text(
                                "Akun : ${controller.listTransaksi[index].accountId ?? 0}",
                                style: TextStyle(fontSize: 8),
                              ),
                              subtitle: Text(
                                "${controller.listTransaksi[index].description}",
                                style: TextStyle(fontSize: 12),
                              ),
                              title: Text(
                                "${controller.listTransaksi[index].amountDebit == 0 ? "Pengeluaran Rp.${controller.listTransaksi[index].amountCredit}" : "Pemasukan Rp. ${controller.listTransaksi[index].amountDebit}"}",
                                style: TextStyle(fontSize: 14),
                              ),
                              trailing: Column(
                                children: [
                                  Text(
                                    "${controller.listTransaksi[index].transationDate}",
                                    style: TextStyle(fontSize: 8),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  }),
            ));
  }
}
