import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lesgo_mobile_dev/app/models/CourseModel.dart'as c;
import 'package:lesgo_mobile_dev/app/models/PaymentModel.dart';
import 'package:lesgo_mobile_dev/app/models/User_UserCourseModel.dart';
import 'package:lesgo_mobile_dev/app/modules/home/views/partner_home_view.dart';
import 'package:lesgo_mobile_dev/app/modules/home/views/user_home_view.dart';
import 'package:lesgo_mobile_dev/app/modules/learning/views/learning_view.dart';
import 'package:lesgo_mobile_dev/app/modules/payment/views/payment_view.dart';
import 'package:lesgo_mobile_dev/app/modules/profile/views/profile_view.dart';
import 'package:lesgo_mobile_dev/app/routes/app_pages.dart';
import 'package:lesgo_mobile_dev/const.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  List userViews = <Widget>[UserHomeView(), LearningView(), ProfileView()];
  List partnerViews = <Widget>[PartnerHomeView(), PaymentView(), ProfileView()];
  //TODO: Implement HomeController
  var courses = <c.Course>[].obs;
  var userCourses = <UserCourse>[].obs;
  var payments = <Payment>[].obs;
  var selected_payment = Payment().obs;
  var selected_view = 0.obs;
  var role_id = 0.obs;
  void navigation(int value) {
    selected_view.value = value;
  }

  void getCourse() async {
    var dio = Dio();
    var sp = await SharedPreferences.getInstance();
    var token = sp.getString("access_token");
    var roleId = sp.getInt("role_id");
    try {
      final response = await dio.get(
          (roleId == 2) ? "$COURSES_PATH/partners" : "$COURSES_PATH/users",
          options: Options(headers: {"authorization": "Bearer $token "}));
      if (response.statusCode == 200) {
        Future.delayed(const Duration(milliseconds: 500), () {
          for (var element in response.data["data"]) {
            courses.add(c.Course.fromJson(element));
            courses.refresh();
          }
        });
      }
    } on DioError catch (e) {
      print(e);
      Get.snackbar(
          e.response!.statusCode.toString(), e.response!.data['message']);
    }
    update();
  }

  void getPayment(company_id) async {
    payments.clear();
    var sp = await SharedPreferences.getInstance();
    var token = sp.getString("access_token");
    var dio = Dio();
    try {
      final response = await dio.get("$COMPANY_PAYMENT_PATH/$company_id",
          options: Options(headers: {"authorization": "Bearer $token"}));
      if (response.statusCode == 200) {
        Future.delayed(const Duration(milliseconds: 500), () {
          for (var element in response.data["data"]) {
            payments.add(Payment.fromJson(element));
          }
        });
      }
    } on DioError catch (e) {
      // print(e.response!.data);
      Get.snackbar(e.response!.statusCode.toString(),
          e.response!.data['message']['message']);
    }
  }

  void join(company_id, course_id, payment_id) async {
    var sp = await SharedPreferences.getInstance();
    var token = sp.getString("access_token");
    var dio = Dio();
    try {
      final response = await dio.post("$USER_COURSES_PATH",
          data: {
            "company_id": company_id,
            "course_id": course_id,
            "payment_id": payment_id
          },
          options: Options(headers: {"authorization": "Bearer $token"}));
      if (response.statusCode == 200) {
        Future.delayed(const Duration(milliseconds: 500), () {
          getUserCourse();
          Get.snackbar("Success", "Please check your course",
              showProgressIndicator: true,
              isDismissible: true,
              overlayBlur: 10);
        });
      }
    } on DioError catch (e) {
      Get.snackbar(e.response!.statusCode.toString(),
          e.response!.data['message']['message']);
    }
  }

  void getUserCourse() async {
    var dio = Dio();
    var sp = await SharedPreferences.getInstance();
    var token = await sp.getString("access_token");
    try {
      final response = await dio.get(USER_COURSES_PATH,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));
      if (response.statusCode == 200) {
        Future.delayed(const Duration(milliseconds: 500), () {
          for (var element in response.data["data"]) {
            userCourses.add(UserCourse.fromJson(element));
            userCourses.refresh();
          }
        });

        // Get.snackbar(response.data["message"], "Login success");
        // print(response.data);
        // Get.offAllNamed(Routes.HOME);
      }
    } on DioError catch (e) {
      print(e.response);
      Get.snackbar(
          e.response!.statusCode.toString(), e.response!.data['message']);
    }
    update();
  }

  void checkAuth() async {
    var sp = await SharedPreferences.getInstance();
    // sp.clear();
    var token = sp.getString("access_token");
    Future.delayed(const Duration(milliseconds: 500), () {
      if (token == null || token == '') {
        Get.offAllNamed(Routes.AUTH);
      } else {
        role_id.value = sp.getInt("role_id") ?? 0;
        Get.snackbar("Loading", "Please wait",
            showProgressIndicator: true, isDismissible: true, overlayBlur: 10);
        getCourse();
        getUserCourse();
      }
    });
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    checkAuth();
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
