import 'package:applikasi_keuangan/global/variable.dart';
import 'package:applikasi_keuangan/model/kategori.dart';
import 'package:applikasi_keuangan/model/kontak.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardForm extends StatefulWidget {
  @override
  _CardFormState createState() => _CardFormState();
}

class _CardFormState extends State<CardForm> {
  int valueProduct = 1;
  int valueStatus = 1;
  DateTime? date;
  TextEditingController _controller = TextEditingController();
  List<Kontak> kontak = [
    Kontak(id: 1, name: "Arman"),
    Kontak(id: 2, name: "Ari"),
    Kontak(id: 3, name: "Aris"),
    Kontak(id: 4, name: "Apang"),
  ];

  List<Kategori> kategori = [
    Kategori(name: "Penjualan", id: 1),
    Kategori(name: "Pengeluaran", id: 2)
  ];

  Kontak? selectedKontak;
  Kategori? selectedItem;

  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date ?? now,
        firstDate: now,
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Txt(
                    "Catat produk terjual?",
                    style: CustomStyle.txtStyle.clone()
                      ..fontSize(12)
                      ..bold()
                      ..textColor(komponenTextColor),
                  ),
                  Spacer(),
                  Radio(
                    groupValue: valueProduct,
                    value: 1,
                    activeColor: appBarColor,
                    onChanged: (int? val) {
                      setState(() {
                        valueProduct = val!;
                      });
                    },
                  ),
                  Container(
                    transform: Matrix4.translationValues(-8, 0, 0),
                    child: Txt(
                      "Ya",
                      style: CustomStyle.txtStyle.clone()
                        ..fontSize(12)
                        ..textColor(komponenTextColor),
                    ),
                  ),
                  Radio(
                    groupValue: valueProduct,
                    activeColor: appBarColor,
                    value: 2,
                    onChanged: (int? val) {
                      setState(() {
                        valueProduct = val!;
                      });
                    },
                  ),
                  Container(
                    transform: Matrix4.translationValues(-8, 0, 0),
                    child: Txt(
                      "Tidak",
                      style: CustomStyle.txtStyle.clone()
                        ..fontSize(12)
                        ..textColor(komponenTextColor),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 8,
              color: lineColor,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Txt(
                    "Total Transaksi",
                    style: CustomStyle.txtStyle.clone()
                      ..bold()
                      ..fontSize(12)
                      ..textColor(komponenTextColor),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: lineColor,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    child: Txt(
                      "Rp. 300.000",
                      style: CustomStyle.txtStyle.clone()
                        ..textColor(appBarColor)
                        ..fontSize(14)
                        ..fontFamily("Montserrat"),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Txt(
                          "Status",
                          style: CustomStyle.txtStyle.clone()
                            ..fontSize(12)
                            ..textColor(komponenTextColor),
                        ),
                        Spacer(),
                        Radio(
                          groupValue: valueStatus,
                          value: 1,
                          activeColor: appBarColor,
                          onChanged: (int? val) {
                            setState(() {
                              valueStatus = val!;
                            });
                          },
                        ),
                        Container(
                          transform: Matrix4.translationValues(-8, 0, 0),
                          child: Txt(
                            "Ya",
                            style: CustomStyle.txtStyle.clone()
                              ..fontSize(12)
                              ..textColor(komponenTextColor),
                          ),
                        ),
                        Radio(
                          groupValue: valueStatus,
                          activeColor: appBarColor,
                          value: 2,
                          onChanged: (int? val) {
                            setState(() {
                              valueStatus = val!;
                            });
                          },
                        ),
                        Container(
                          transform: Matrix4.translationValues(-8, 0, 0),
                          child: Txt(
                            "Tidak",
                            style: CustomStyle.txtStyle.clone()
                              ..fontSize(12)
                              ..textColor(komponenTextColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Txt(
                    "Kontak",
                    style: CustomStyle.txtStyle.clone()
                      ..fontSize(12)
                      ..bold()
                      ..textColor(komponenTextColor),
                  ),
                  SizedBox(
                    height: 8,
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
                        value: selectedKontak,
                        onChanged: (Kontak? value) {
                          setState(() {
                            selectedKontak = value;
                          });
                        },
                        hint: Txt(
                          "Pilih Kontak",
                          style: CustomStyle.txtStyle.clone()
                            ..fontSize(12)
                            ..textColor(txtHintColor),
                        ),
                        isDense: true,
                        isExpanded: true,
                        underline: Padding(
                          padding: EdgeInsets.all(5),
                        ),
                        items: kontak.map((e) {
                          return DropdownMenuItem(
                              value: e,
                              child: Txt(
                                e.name!,
                                style: CustomStyle.txtStyle.clone()
                                  ..fontSize(12)
                                  ..textColor(appBarColor),
                              ));
                        }).toList()),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.info_outline,
                          size: 15,
                          color: appBarColor,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Txt(
                          "Kontak tidak perlu diisi jika sudah lunas",
                          style: CustomStyle.txtStyle.clone()
                            ..fontSize(12)
                            ..textColor(appBarColor)
                            ..bold(),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Txt(
                    "Tanggal Transaksi",
                    style: CustomStyle.txtStyle.clone()
                      ..fontSize(12)
                      ..bold()
                      ..textColor(komponenTextColor),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _controller,
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
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: appBarColor,
                          width: 1,
                        ),
                      ),
                    ),
                    onTap: () async {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      await _selectDate(context);
                      _controller.text = DateFormat('yyyy/MM/dd')
                          .format(date ?? DateTime.now());
                    },
                  )
                ],
              ),
            ),
            Container(
              height: 8,
              color: lineColor,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Txt(
                    "Kategori",
                    style: CustomStyle.txtStyle.clone()
                      ..fontSize(12)
                      ..bold()
                      ..textColor(komponenTextColor),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: lineColor,
                        width: 1,
                      ),
                      color: lineColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton(
                        value: selectedItem,
                        onChanged: (Kategori? value) {
                          setState(() {
                            selectedItem = value;
                          });
                        },
                        hint: Txt(
                          "Pilih Kategori",
                          style: CustomStyle.txtStyle.clone()
                            ..fontSize(12)
                            ..textColor(txtHintColor),
                        ),
                        isDense: true,
                        isExpanded: true,
                        underline: Padding(
                          padding: EdgeInsets.all(5),
                        ),
                        items: kategori.map((e) {
                          return DropdownMenuItem(
                              value: e,
                              child: Txt(
                                e.name!,
                                style: CustomStyle.txtStyle.clone()
                                  ..fontSize(12)
                                  ..textColor(appBarColor),
                              ));
                        }).toList()),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
