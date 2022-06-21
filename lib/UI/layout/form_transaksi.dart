import 'package:applikasi_keuangan/UI/komponen/card_form.dart';
import 'package:applikasi_keuangan/controller/form_transaksi_controller.dart';
import 'package:applikasi_keuangan/global/variable.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormTransaksi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormTransaksiController>(
      init: FormTransaksiController(),
      builder: (controller) => Scaffold(
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
                  controller: controller.tabController,
                  labelColor: whiteColor,
                  unselectedLabelColor: appBarColor,
                  indicator: controller.index == 0
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
                  tabs: controller.myTabs,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Expanded(
                  child: Column(
                children: [
                  Expanded(
                    child: TabBarView(
                      controller: controller.tabController,
                      children: [CardForm(), CardForm()],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.submitTransaksi();
                    },
                    child: customButton("Submit Transaksi"),
                  ),
                  SizedBox(
                    height: setHeight(32),
                  )
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
