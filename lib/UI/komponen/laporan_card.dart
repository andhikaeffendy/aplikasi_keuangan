import 'package:applikasi_keuangan/global/variable.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';

class LaporanCard extends StatelessWidget {
  final String title;
  final String harga;

  LaporanCard({required this.title, required this.harga});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: setWidth(16), vertical: setHeight(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Spacer(),
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Txt(
                  "${this.title}",
                  style: CustomStyle.txtStyle.clone()
                    ..textColor(txtHintColor)
                    ..fontSize(setFont(12)),
                ),
                SizedBox(
                  height: setHeight(4),
                ),
                Txt(
                  "${this.harga}",
                  style: CustomStyle.txtStyle.clone()
                    ..textColor(appBarColor)
                    ..fontSize(setFont(16))
                    ..bold()
                    ..fontFamily("Montserrat"),
                )
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.arrow_forward_ios,
                color: txtHintColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
