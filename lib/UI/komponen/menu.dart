import 'package:applikasi_keuangan/controller/menu_controller.dart';
import 'package:applikasi_keuangan/global/variable.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MenuItem extends GetView<MenuController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: setHeight(83),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: () {
              controller.changeBottomPage(0);
            },
            minWidth: setWidth(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/laporan.png",
                  width: setWidth(25),
                ),
                controller.selectedIndex == 0
                    ? Txt(
                        "Bumdes",
                        style: CustomStyle.textBottomNavigation.clone()
                          ..textColor(appBarColor),
                      )
                    : Txt(
                        "Bumdes",
                        style: CustomStyle.textBottomNavigation,
                      )
              ],
            ),
          ),
          MaterialButton(
            onPressed: () {
              controller.changeBottomPage(1);
            },
            minWidth: setWidth(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/transaksi.png",
                  width: setWidth(25),
                ),
                controller.selectedIndex == 1
                    ? Txt(
                        "Riwayat",
                        style: CustomStyle.textBottomNavigation.clone()
                          ..textColor(appBarColor),
                      )
                    : Txt(
                        "Riwayat",
                        style: CustomStyle.textBottomNavigation,
                      )
              ],
            ),
          ),
          MaterialButton(
            onPressed: () {
              controller.changeBottomPage(2);
            },
            minWidth: setWidth(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person_outline,
                  color: controller.selectedIndex == 2
                      ? appBarColor
                      : txtHintColor,
                  size: setRadius(25),
                ),
                controller.selectedIndex == 2
                    ? Txt(
                        "Profile",
                        style: CustomStyle.textBottomNavigation.clone()
                          ..textColor(appBarColor),
                      )
                    : Txt(
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
