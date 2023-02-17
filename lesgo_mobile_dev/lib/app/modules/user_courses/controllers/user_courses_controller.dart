import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lesgo_mobile_dev/app/models/CourseDetailModel.dart';
import 'package:lesgo_mobile_dev/app/models/UserCourseModel.dart';
import 'package:lesgo_mobile_dev/app/models/CourseTagModel.dart';
import 'package:lesgo_mobile_dev/app/routes/app_pages.dart';
import 'package:lesgo_mobile_dev/const.dart';
import 'package:lesgo_mobile_dev/helpers/helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserCoursesController extends GetxController {
  //TODO: Implement UserCoursesController

  final count = 0.obs;
  var courseDetail = CourseDetail().obs;
  // var courseTag = CourseTag().obs;
  var userCourses = <UserCourse>[].obs;
  var imageTemp = File('').obs;
  var name = TextEditingController();
  var desc = TextEditingController();
  var quota = TextEditingController();
  var price = TextEditingController();
  var startedDate = TextEditingController();
  var endDate = TextEditingController();

  void getUserCourses(data) async {
    var dio = Dio();
    var sp = await SharedPreferences.getInstance();
    var token = sp.getString("access_token");
    try {
      final response = await dio.get(
          "$COURSES_PATH/partners/${data["course_id"]}",
          options: await Helpers().headers());
      if (response.statusCode == 200) {
        courseDetail.value = CourseDetail.fromJson(response.data["data"]);
        userCourses.clear();
        Get.snackbar("Loading", "Please wait",
            showProgressIndicator: true, isDismissible: true, overlayBlur: 10);
        Future.delayed(Duration(milliseconds: 500), () {
          for (var element in response.data["data"]['user_courses']) {
            userCourses.add(UserCourse.fromJson(element));
            userCourses.refresh();
          }
        });
        update();
      }
    } on DioError catch (e) {
      Get.snackbar(
          e.response!.statusCode.toString(), e.response!.data['message']);
    }
    update();
  }

  void approveUser(userCourseId, course_id, is_approved) async {
    var dio = Dio();
    var sp = await SharedPreferences.getInstance();
    var token = sp.getString("access_token");
    try {
      final response = await dio.put("$USER_COURSES_PATH/$userCourseId",
          data: jsonEncode({'is_approved': is_approved}),
          options: await Helpers().headers());
      if (response.statusCode == 200) {
        Get.snackbar(response.data["message"], response.data["data"]["message"],
            showProgressIndicator: true,
            isDismissible: true,
            overlayBlur: 10,
            duration: const Duration(milliseconds: 800));
        getUserCourses({"course_id": course_id});
        update();
      }
    } on DioError catch (e) {
      Get.snackbar(
          e.response!.statusCode.toString(), e.response!.data['message']);
    }
  }

  void addCourse() async {
    var api = Dio();
    String fileName = imageTemp.value.path.split('/').last;
    if (quota.text == '' || price.text == '') {
      Get.snackbar("Error", "Kuota and Price cannot be empty");
    } else {
      var sp = await SharedPreferences.getInstance();
      var company_id = sp.getInt('company_id');
      dio.FormData formData = dio.FormData.fromMap({
        "company_id": company_id,
        "name": name.text, 
        "description": desc.text,
        "quota": (quota.text == '') ? 0 : int.parse(quota.text),
        "price": (price.text == '') ? 0 : int.parse(price.text),
        "img": await dio.MultipartFile.fromFile(
          imageTemp.value.path,
          filename: fileName,
        ),
        "start_date": startedDate.text.replaceAll('-', '/'),
        "end_date": endDate.text.replaceAll('-', '/'),
      });
      try {
        final response = await api.post(COURSES_PATH,
            data: formData, options: await Helpers().headers());
        if (response.statusCode == 200 || response.statusCode == 201) {
          Get.snackbar("Success", "Your course has been created",
              showProgressIndicator: true,
              isDismissible: true,
              overlayBlur: 10,
              duration: const Duration(milliseconds: 800));
          Get.offNamedUntil(Routes.HOME, (route) => false);
        }
      } on DioError catch (e) {
        Get.snackbar(
            e.response!.statusCode.toString(), e.response!.data['message']);
      }
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
