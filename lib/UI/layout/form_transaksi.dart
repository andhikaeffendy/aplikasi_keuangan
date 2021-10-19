import 'package:applikasi_keuangan/UI/komponen/card_form.dart';
import 'package:applikasi_keuangan/global/variable.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';

class FormTransaksi extends StatefulWidget {
  @override
  _FormTransaksiState createState() => _FormTransaksiState();
}

class _FormTransaksiState extends State<FormTransaksi>
    with SingleTickerProviderStateMixin {
  TabController? _controller;

  @override
  void initState() {
    _controller = new TabController(length: 2, vsync: this);
    _controller!.addListener(tabControllerListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  tabControllerListener() {
    if (_controller!.index == 0) {
      setState(() {});
    } else {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Txt(
          "Transaksi Baru",
          style: CustomStyle.txtStyle.clone()..bold(),
        ),
        centerTitle: true,
        backgroundColor: appBarColor,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Center(
                child: Icon(
                  Icons.close,
                  size: 25,
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: appBarColor),
                  borderRadius: BorderRadius.circular(25)),
              constraints: BoxConstraints(maxHeight: 80, minHeight: 50),
              child: TabBar(
                controller: _controller,
                labelColor: whiteColor,
                unselectedLabelColor: appBarColor,
                indicator: _controller!.index == 0
                    ? BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            bottomLeft: Radius.circular(25)),
                        color: appBarColor)
                    : BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25)),
                        color: appBarColor),
                tabs: [
                  Txt("Pemasukan"),
                  Txt("Pengeluaran"),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
                child: TabBarView(
              controller: _controller,
              children: [CardForm(), CardForm()],
            ))
          ],
        ),
      ),
    );
  }
}
