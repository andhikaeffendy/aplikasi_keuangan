import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  var selectedIndex = 0;
  PageController pageController = PageController();

  void changeBottomPage(int index) {
    selectedIndex = index;
    update();
  }
}
