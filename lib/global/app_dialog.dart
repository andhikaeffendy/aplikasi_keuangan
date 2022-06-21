import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDialog {
  static showCircular(context) {
    Get.defaultDialog(
        content: Center(
          child: CircularProgressIndicator(),
        ),
        title: "");
  }

  static closeCircular(context) {
    Get.back();
  }
}
