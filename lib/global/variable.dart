import 'package:applikasi_keuangan/routes/routes.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';

Color appBarColor = Color(0xFF17657B);
Color bgColor = Color(0xFF114C5C);
Color txtHintColor = Color(0xFF9C9C9C);
Color btnColor = Color(0xFF114C5C);
Color txtBlueColor = Color(0xFF0972AF);
Color whiteColor = Colors.white;
Color lineColor = Colors.grey.withOpacity(0.1);
Color komponenTextColor = Colors.black87;

abstract class CustomStyle {
  static TxtStyle txtStyle = TxtStyle()
    ..fontSize(18)
    ..fontFamily("Comfortaa")
    ..textColor(Colors.white);

  static TextStyle textFormFieldStyle = TextStyle(
      color: txtHintColor, fontSize: 14, fontFamily: "Comfortaa", height: 1.5);

  static TextStyle labelTextStyle =
      TextStyle(color: appBarColor, fontSize: 14, fontFamily: "Montserrat");

  static TxtStyle textBottomNavigation = TxtStyle()
    ..fontFamily("Comfortaa")
    ..fontSize(12)
    ..textColor(txtHintColor);

  static ParentStyle buttonStyle = ParentStyle()
    ..background.color(bgColor)
    ..borderRadius(all: 32)
    ..elevation(1)
    ..margin(horizontal: 32)
    ..padding(vertical: 12);
}

nextPage(context, String page) async {
  Navigator.of(context).pushNamed(page);
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
          ..fontSize(16)
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
          height: 16,
        ),
        Image.asset(
          "assets/logo.png",
          fit: BoxFit.cover,
          height: 120,
        ),
      ],
    ),
  );
}

customTextFormField(
    IconData icon, String text, TextInputType type, bool obscure) {
  return TextFormField(
    decoration: InputDecoration(
        hintText: text,
        prefixIcon: Icon(
          icon,
          color: Color(0xFF9C9C9C),
          size: 25,
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
            ..fontSize(12)
            ..textColor(txtHintColor),
        ),
        SizedBox(
          height: 4,
        ),
        Txt(
          title,
          style: CustomStyle.txtStyle.clone()
            ..fontSize(14)
            ..textColor(Colors.black87)
            ..fontFamily("Montserrat"),
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: Colors.black45,
        )
      ],
    ),
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
