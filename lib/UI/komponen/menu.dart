import 'package:applikasi_keuangan/bloc/navigator_bloc_bloc.dart';
import 'package:applikasi_keuangan/global/variable.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuItem extends StatefulWidget {
  const MenuItem({Key? key}) : super(key: key);

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<NavigatorBlocBloc>(context);
    return Container(
      height: 83,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: () {
              bloc.add(OnSelectedPage(0));
            },
            minWidth: 25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/laporan.png",
                  width: 25,
                ),
                Txt(
                  "Laporan",
                  style: CustomStyle.textBottomNavigation,
                )
              ],
            ),
          ),
          MaterialButton(
            onPressed: () {
              bloc.add(OnSelectedPage(1));
            },
            minWidth: 25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/transaksi.png",
                  width: 25,
                ),
                Txt(
                  "Transaksi",
                  style: CustomStyle.textBottomNavigation,
                )
              ],
            ),
          ),
          MaterialButton(
            onPressed: () {
              bloc.add(OnSelectedPage(2));
            },
            minWidth: 25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/tagihan.png",
                  width: 25,
                ),
                Txt(
                  "Tagihan",
                  style: CustomStyle.textBottomNavigation,
                )
              ],
            ),
          ),
          MaterialButton(
            onPressed: () {
              bloc.add(OnSelectedPage(3));
            },
            minWidth: 25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person_outline,
                  color: txtHintColor,
                  size: 25,
                ),
                Txt(
                  "Profile",
                  style: CustomStyle.textBottomNavigation,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
