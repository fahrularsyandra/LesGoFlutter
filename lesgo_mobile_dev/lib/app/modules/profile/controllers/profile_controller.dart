import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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
  var username = TextEditingController();
  var age = TextEditingController();
  var address = TextEditingController();
  var editFlag = false.obs;
  var imageTemp = File('').obs;

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
      if (response.statusCode == 200 || response.statusCode == 201) {
        user.value = User.fromJson(response.data['data']);
        user.refresh();
        if (user.value.roleId == 2) {
          if (response.data['data']['companies'].isNotEmpty) {
            company.value =
                Company.fromJson(response.data['data']['companies'][0]);
            company.refresh();
            var pref = await SharedPreferences.getInstance();
            pref.setInt('company_id', company.value.id!);
            await pref.reload();
          }
        }
      }
    } on DioError catch (e) {
      Get.snackbar(
          e.response!.statusCode.toString(), e.response!.data['message']);
    }
    update();
  }

  void editProfile() async {
    var dio = Dio();
    var sp = await SharedPreferences.getInstance();
    var company_id = sp.getInt('company_id');
    String fileName = imageTemp.value.path.split('/').last;
    var data = <String, dynamic>{
      "username": username.text,
      "age": age.text,
      "address": address.text
    };
    if(fileName.isNotEmpty){
      data['img'] = await d.MultipartFile.fromFile(
        imageTemp.value.path,
        filename: fileName,
      );
    }
    d.FormData formData = d.FormData.fromMap(data);
    try {
      final response = await dio.put(USER,
          data: formData, options: await Helpers().headers());
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar("Success", "Your course has been created",
            showProgressIndicator: true,
            isDismissible: true,
            overlayBlur: 10,
            duration: const Duration(milliseconds: 800));
        Get.offNamedUntil(Routes.HOME, (route) => false);
       getUser();
      }
    } on DioError catch (e) {
      // Get.snackbar(
      //     e.response!.statusCode.toString(), e.response!.data['message']);
    }
  }

  void initEdit(data) {
    username.text = data['username'];
    address.text = data['profile']['address'] ?? '';
    age.text = data['profile']['age'].toString();
  }

  check(data) {
    if (username.text != data['username']) {
      editFlag.value = true;
      return;
    } else if (age.text != data['profile']['age'].toString()) {
      editFlag.value = true;
      return;
    } else if (address.text != data['profile']['address']) {
      editFlag.value = true;
      return;
    } else {
      editFlag.value = false;
      return;
    }
  }

  void pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      imageTemp.value = File(image.path);
    } on PlatformException catch (e) {
      Get.snackbar("Error", e.message!);
    }
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
