import 'package:applikasi_keuangan/UI/komponen/card_profile.dart';
import 'package:applikasi_keuangan/global/variable.dart';
import 'package:applikasi_keuangan/routes/routes.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {},
              child: Container(
                child: Center(
                  child: Txt(
                    "Edit",
                    style: CustomStyle.txtStyle.clone()
                      ..textAlign.center()
                      ..fontSize(14)
                      ..fontFamily("Comfortaa")
                      ..padding(right: 16),
                  ),
                ),
              ),
            )
          ],
          title: Txt(
            "Profile",
            style: CustomStyle.txtStyle.clone()..bold(),
          ),
          backgroundColor: appBarColor,
          centerTitle: true,
        ),
        body: Stack(
          children: [
            customBackground(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 8,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://www.vhv.rs/dpng/d/426-4264903_user-avatar-png-picture-avatar-profile-dummy-transparent.png"),
                  maxRadius: 40,
                  minRadius: 35,
                ),
                SizedBox(
                  height: 8,
                ),
                Txt(
                  "Toko ABC",
                  style: CustomStyle.txtStyle.clone()..bold(),
                ),
                SizedBox(
                  height: 8,
                ),
                Txt(
                  "Ganti foto",
                  style: CustomStyle.txtStyle.clone()..fontSize(12),
                ),
                SizedBox(
                  height: 16,
                ),
                CardProfile(),
                SizedBox(
                  height: 24,
                ),
                InkWell(
                  onTap: () {
                    nextPage(context, RouteGenerator.loginPage);
                  },
                  child: customButton("LOG OUT"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
