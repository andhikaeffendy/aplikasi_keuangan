import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BerandaController extends GetxController
    with SingleGetTickerProviderMixin {
  TabController? tabController;

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
  }
}
