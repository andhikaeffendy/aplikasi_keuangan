import 'package:applikasi_keuangan/controller/form_transaksi_controller.dart';
import 'package:applikasi_keuangan/global/variable.dart';
import 'package:applikasi_keuangan/model/Account.dart';
import 'package:applikasi_keuangan/model/kategori.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';

class CardForm extends StatefulWidget {
  @override
  _CardFormState createState() => _CardFormState();
}

class _CardFormState extends State<CardForm> {
  int valueProduct = 1;
  int valueStatus = 1;
  DateTime? date;

  List<Kategori> kategori = [
    Kategori(name: "Penjualan", id: 1),
    Kategori(name: "Pengeluaran", id: 2)
  ];
  Kategori? selectedItem;

  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date ?? now,
        firstDate: new DateTime.utc(2018),
        lastDate: DateTime(2101));
    if (picked != null && picked != date) {
      print('hello $picked');
      setState(() {
        date = picked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder<FormTransaksiController>(
        init: FormTransaksiController(),
        builder: (controller) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: setWidth(16), vertical: setHeight(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Txt(
                      "Nomor Voucher",
                      style: CustomStyle.txtStyle.clone()
                        ..fontSize(setFont(12))
                        ..bold()
                        ..textColor(komponenTextColor),
                    ),
                    textFormTransaction("Masukkan Nomor Voucher",
                        controller.voucherController, TextInputType.text),
                    SizedBox(
                      height: setHeight(16),
                    ),
                    Txt(
                      "Akun",
                      style: CustomStyle.txtStyle.clone()
                        ..fontSize(setFont(12))
                        ..bold()
                        ..textColor(komponenTextColor),
                    ),
                    SizedBox(
                      height: setHeight(8),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: lineColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color: lineColor,
                      ),
                      child: DropdownButton(
                          value: controller.selectedAccount,
                          onChanged: (Account? value) {
                            setState(() {
                              controller.selectedAccount = value;
                            });
                          },
                          hint: Txt(
                            "Pilih Akun",
                            style: CustomStyle.txtStyle.clone()
                              ..fontSize(setFont(12))
                              ..textColor(txtHintColor),
                          ),
                          isDense: true,
                          isExpanded: true,
                          underline: Padding(
                            padding: EdgeInsets.all(setWidth(6)),
                          ),
                          items: controller.listAccount.map((e) {
                            return DropdownMenuItem(
                                value: e,
                                child: Txt(
                                  e.name!,
                                  style: CustomStyle.txtStyle.clone()
                                    ..fontSize(setFont(12))
                                    ..textColor(appBarColor),
                                ));
                          }).toList()),
                    ),
                    SizedBox(
                      height: setHeight(16),
                    ),
                    Txt(
                      "Tanggal Transaksi",
                      style: CustomStyle.txtStyle.clone()
                        ..fontSize(setFont(12))
                        ..bold()
                        ..textColor(komponenTextColor),
                    ),
                    SizedBox(
                      height: setHeight(16),
                    ),
                    TextFormField(
                      controller: controller.dateController,
                      decoration: InputDecoration(
                        errorStyle: CustomStyle.textFormFieldStyle,
                        hintText: "Pilih Tanggal",
                        hintStyle: CustomStyle.textFormFieldStyle,
                        fillColor: lineColor,
                        focusColor: lineColor,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: appBarColor,
                            width: setWidth(1),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: appBarColor,
                            width: setWidth(1),
                          ),
                        ),
                      ),
                      onTap: () async {
                        FocusScope.of(context).requestFocus(new FocusNode());
                        await _selectDate(context);
                        controller.dateController.text =
                            DateFormat('yyyy/MM/dd')
                                .format(date ?? DateTime.now());
                      },
                    ),
                    SizedBox(
                      height: setHeight(16),
                    ),
                    Txt(
                      "Perkiraan",
                      style: CustomStyle.txtStyle.clone()
                        ..fontSize(setFont(12))
                        ..bold()
                        ..textColor(komponenTextColor),
                    ),
                    textFormTransaction("Masukkan Perkiraan",
                        controller.deskripsiController, TextInputType.text),
                    SizedBox(
                      height: setHeight(16),
                    ),
                    GetBuilder<FormTransaksiController>(
                      init: FormTransaksiController(),
                      builder: (formController) => formController.index == 0
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Txt(
                                  "Pemasukan",
                                  style: CustomStyle.txtStyle.clone()
                                    ..fontSize(setFont(12))
                                    ..bold()
                                    ..textColor(komponenTextColor),
                                ),
                                textFormTransaction(
                                    "Masukkan Pemasukan",
                                    controller.pemasukanController,
                                    TextInputType.number),
                                SizedBox(
                                  height: setHeight(16),
                                ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Txt(
                                  "Pengeluaran",
                                  style: CustomStyle.txtStyle.clone()
                                    ..fontSize(setFont(12))
                                    ..bold()
                                    ..textColor(komponenTextColor),
                                ),
                                textFormTransaction(
                                    "Masukkan Pengeluaran",
                                    controller.pengeluaranController,
                                    TextInputType.number),
                                SizedBox(
                                  height: setHeight(16),
                                ),
                              ],
                            ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
