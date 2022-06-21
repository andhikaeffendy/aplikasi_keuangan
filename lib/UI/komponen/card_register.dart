import 'package:applikasi_keuangan/controller/register_controller.dart';
import 'package:applikasi_keuangan/global/variable.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CardRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      builder: (controller) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: Offset(0.0, 3.0), //(x,y)
              blurRadius: setRadius(6.0),
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(horizontal: setWidth(32)),
        padding: EdgeInsets.symmetric(
            horizontal: setWidth(16), vertical: setHeight(32)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            customTextFormField(Icons.person, "Alamat Email",
                TextInputType.emailAddress, false, controller.emailController),
            SizedBox(
              height: setHeight(8),
            ),
            customTextFormField(Icons.phone_android_sharp, "Nomor ponsel",
                TextInputType.number, false, controller.phoneController),
            SizedBox(
              height: setHeight(8),
            ),
            customTextFormField(
                Icons.lock_open,
                "Kata Sandi",
                TextInputType.visiblePassword,
                true,
                controller.passwordController),
            SizedBox(
              height: setHeight(8),
            ),
            customTextFormField(
                Icons.lock_open,
                "Ulangi Kata Sandi",
                TextInputType.visiblePassword,
                true,
                controller.newPasswordController),
          ],
        ),
      ),
    );
  }
}
