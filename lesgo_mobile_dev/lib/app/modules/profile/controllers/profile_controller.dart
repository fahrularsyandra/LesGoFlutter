import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:lesgo_mobile_dev/app/models/CourseTagModel.dart';
import 'package:lesgo_mobile_dev/app/models/UserModel.dart';
import 'package:lesgo_mobile_dev/app/routes/app_pages.dart';
import 'package:lesgo_mobile_dev/const.dart';
import 'package:lesgo_mobile_dev/helpers/helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  var user = User().obs;
  var company = Company().obs;

  void logout() async {
    var sp = await SharedPreferences.getInstance();
    await sp.clear();
    await sp.reload();
    Get.snackbar("Success", "You have been logout");
    Get.offAllNamed(Routes.AUTH);
  }

  void getUser() async {
    var dio = Dio();
    try {
      final response =
          await dio.get(PROFILE, options: await Helpers().headers());
          print("profile = ${response.data}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        user.value = User.fromJson(response.data['data']);
        user.refresh();
        if (user.value.roleId == 2) {
          company.value =
              Company.fromJson(response.data['data']['companies'][0]);
          company.refresh();
        }
      }
    } on DioError catch (e) {
      Get.snackbar(
          e.response!.statusCode.toString(), e.response!.data['message']);
    }
    update();
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getUser();
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
