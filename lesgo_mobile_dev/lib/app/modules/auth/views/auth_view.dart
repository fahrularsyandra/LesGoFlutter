import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lesgo_mobile_dev/app/modules/auth/views/login_view.dart';
import 'package:lesgo_mobile_dev/app/modules/auth/views/register_view.dart';
import 'package:lesgo_mobile_dev/styles/colors.dart';
import 'package:lesgo_mobile_dev/styles/text.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                h3("LesGo"),
                h4("on a new journey", fw: FontWeight.w300)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => LoginView());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: BackgroundColor.grey,
                        borderRadius: BorderRadius.circular(8)),
                    width: 100,
                    height: 50,
                    child: Center(
                      child: h5("Login"),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const RegisterView());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: BackgroundColor.grey,
                        borderRadius: BorderRadius.circular(8)),
                    width: 100,
                    height: 50,
                    child: Center(
                      child: h5("Sign Up"),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
