import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:lesgo_mobile_dev/app/routes/app_pages.dart';
import 'package:lesgo_mobile_dev/const.dart';
import 'package:lesgo_mobile_dev/styles/colors.dart';
import 'package:lesgo_mobile_dev/styles/text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthController

  final count = 0.obs;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();

  void login() async {
    var sp = await SharedPreferences.getInstance();
    var dio = Dio();
    var data = {"email": email.text, "password": password.text};
    try {
      final response =
          await dio.post("${DOMAIN}/login", data: json.encode(data));
      if (response.statusCode == 200) {
        sp.setInt("role_id", response.data["data"]["role_id"]);
        await sp.setString(
            "access_token", response.data["data"]["access_token"]);
        await sp.reload();
        
        Get.offAllNamed(Routes.HOME);
      }
    } on DioError catch (e) {
      Get.snackbar(e.response!.statusCode.toString(),
          e.response!.data['message']['message']);
    }
  }

  void register() async {
    var dio = Dio();
    var data = {
      "username": username.text,
      "email": email.text,
      "password": password.text
    };
    try {
      final response =
          await dio.post("${DOMAIN}/register", data: json.encode(data));
      if (response.statusCode == 201) {
        Get.snackbar(response.data['message'].toString(),
            "Please login with your new account");
        Get.offAllNamed(Routes.AUTH);
      }
    } on DioError catch (e) {
      Get.snackbar(
          e.response!.statusCode.toString(), e.response!.data["message"]);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
