import 'package:applikasi_keuangan/model/user.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';

const String domain = "https://siapbumdes.bekasikab.go.id/";
const String api_url = domain + "/api/v1/";

User currentUser = User();
Color appBarColor = Color(0xFF17657B);
Color bgColor = Color(0xFF114C5C);
Color txtHintColor = Color(0xFF9C9C9C);
Color btnColor = Color(0xFF114C5C);
Color txtBlueColor = Color(0xFF0972AF);
Color whiteColor = Colors.white;
Color lineColor = Colors.grey.withOpacity(0.1);
Color komponenTextColor = Colors.black87;
Size sizeScreen = Size(390, 908);

double setWidth(double size) {
  return ScreenUtil().setWidth(size);
}

double setHeight(double size) {
  return ScreenUtil().setHeight(size);
}

double setFont(double size) {
  return ScreenUtil().setSp(size);
}

double setRadius(double size) {
  return ScreenUtil().radius(size);
}

abstract class CustomStyle {
  static TxtStyle txtStyle = TxtStyle()
    ..fontSize(setFont(18))
    ..fontFamily("Comfortaa")
    ..textColor(Colors.white);

  static TextStyle textFormFieldStyle = TextStyle(
      color: txtHintColor,
      fontSize: setFont(14),
      fontFamily: "Comfortaa",
      height: 1.5);

  static TextStyle textFormTransaksiStyle = TextStyle(
      color: Colors.black87,
      fontSize: setFont(12),
      fontFamily: "Comfortaa",
      height: 1.5);

  static TextStyle textFormHint = TextStyle(
      color: txtHintColor,
      fontSize: setFont(12),
      fontFamily: "Comfortaa",
      height: 1.5);

  static TextStyle labelTextStyle = TextStyle(
      color: appBarColor, fontSize: setFont(14), fontFamily: "Montserrat");

  static TxtStyle textBottomNavigation = TxtStyle()
    ..fontFamily("Comfortaa")
    ..fontSize(setFont(12))
    ..textColor(txtHintColor);

  static ParentStyle buttonStyle = ParentStyle()
    ..background.color(bgColor)
    ..borderRadius(all: setRadius(32))
    ..elevation(1)
    ..margin(horizontal: setWidth(32))
    ..padding(vertical: setHeight(12));
}

nextPage(context, String page) async {
  Get.toNamed(page);
}

startNewPage(context, String page) async {
  Get.offAllNamed(page);
}

customButton(String text) {
  return Parent(
    style: CustomStyle.buttonStyle,
    child: Container(
      width: double.infinity,
      child: Txt(
        text,
        style: CustomStyle.txtStyle.clone()
          ..alignment.center()
          ..fontFamily("Montserrat")
          ..fontSize(setFont(16))
          ..bold(),
      ),
    ),
  );
}

customHeader() {
  return Container(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: setHeight(16),
        ),
        Image.asset(
          "assets/logo.png",
          fit: BoxFit.cover,
          height: setHeight(120),
        ),
      ],
    ),
  );
}

customTextFormField(IconData icon, String text, TextInputType type,
    bool obscure, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
        hintText: text,
        prefixIcon: Icon(
          icon,
          color: Color(0xFF9C9C9C),
          size: setRadius(25),
        ),
        hintStyle: CustomStyle.textFormFieldStyle),
    style: CustomStyle.textFormFieldStyle,
    keyboardType: type,
    obscureText: obscure,
  );
}

textFormFieldCustom(String header, String title) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Txt(
          header,
          style: CustomStyle.txtStyle.clone()
            ..fontSize(setFont(12))
            ..textColor(txtHintColor),
        ),
        SizedBox(
          height: setHeight(4),
        ),
        Txt(
          title,
          style: CustomStyle.txtStyle.clone()
            ..fontSize(setFont(14))
            ..textColor(Colors.black87)
            ..fontFamily("Montserrat"),
        ),
        Container(
          width: double.infinity,
          height: setHeight(1),
          color: Colors.black45,
        )
      ],
    ),
  );
}

textFormTransaction(
    String text, TextEditingController controller, TextInputType type) {
  return TextFormField(
    controller: controller,
    decoration:
        InputDecoration(hintText: text, hintStyle: CustomStyle.textFormHint),
    style: CustomStyle.textFormTransaksiStyle,
    keyboardType: type,
  );
}

customBackground() {
  return Container(
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
            flex: 1,
            child: Container(
              color: bgColor,
            )),
        Flexible(
            flex: 3,
            child: Container(
              color: whiteColor,
            ))
      ],
    ),
  );
}
