import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lesgo_mobile_dev/app/models/CourseModel.dart' as c;
import 'package:lesgo_mobile_dev/app/models/PaymentModel.dart';
import 'package:lesgo_mobile_dev/app/models/User_UserCourseModel.dart';
import 'package:lesgo_mobile_dev/app/modules/home/views/partner_home_view.dart';
import 'package:lesgo_mobile_dev/app/modules/home/views/user_home_view.dart';
import 'package:lesgo_mobile_dev/app/modules/learning/views/learning_view.dart';
import 'package:lesgo_mobile_dev/app/modules/payment/views/payment_detail_view.dart';
import 'package:lesgo_mobile_dev/app/modules/payment/views/payment_view.dart';
import 'package:lesgo_mobile_dev/app/modules/profile/views/profile_view.dart';
import 'package:lesgo_mobile_dev/app/routes/app_pages.dart';
import 'package:lesgo_mobile_dev/const.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../helpers/helpers.dart';
import '../../../models/PaymentDetailModel.dart' as pd;

class HomeController extends GetxController {
  List userViews = <Widget>[UserHomeView(), LearningView(), ProfileView()];
  List partnerViews = <Widget>[PartnerHomeView(), PaymentView(), ProfileView()];
  //TODO: Implement HomeController
  var search = TextEditingController();
  var courses = <c.Course>[].obs;
  var userCourses = <UserCourse>[].obs;
  var payments = <Payment>[].obs;
  var selected_payment = Payment().obs;
  var selected_view = 0.obs;
  var role_id = 0.obs;
  var payment_detail = pd.PaymentDetail().obs;
  var page = 1.obs;
  var max_page = 0.obs;
  var count_data = 0.obs;

  void navigation(int value) {
    selected_view.value = value;
  }

  Timer? _debounce;

  void getCourse() async {
    var dio = Dio();
    var sp = await SharedPreferences.getInstance();
    var token = sp.getString("access_token");
    var roleId = sp.getInt("role_id");
    courses.clear();
    try {
      final response = await dio.get(
          (roleId == 2) ? "$COURSES_PATH/partners" : COURSES_PATH,
          options: Options(headers: {"authorization": "Bearer $token "}),
          queryParameters: <String, dynamic>{'page': page.value});
      if (response.statusCode == 200) {
        Future.delayed(const Duration(milliseconds: 500), () {
          if (roleId == 2) {
            if (response.data["data"].isNotEmpty) {
              for (var element in response.data["data"]) {
                courses.add(c.Course.fromJson(element));
                courses.refresh();
              }
            }
          } else {
            if (response.data["data"]['data'].isNotEmpty) {
              count_data.value = response.data['data']['count_data'];
              if (count_data.value != 0 && count_data % 3 != 0) {
                max_page.value = ((count_data ~/ 3) + 1);
              } else {
                max_page.value = count_data.value ~/ 3;
              }

              print(max_page.value);

              for (var element in response.data["data"]['data']) {
                courses.add(c.Course.fromJson(element));
                courses.refresh();
              }
            }
          }
        });
      }
    } on DioError catch (e) {
      Get.snackbar(
          e.response!.statusCode.toString(), e.response!.data['message']);
    }
    update();
  }

  void searchCourse() async {
    courses.clear();
    page.value = 1;
    var dio = Dio();
    var sp = await SharedPreferences.getInstance();
    var token = sp.getString("access_token");
    try {
      final response = await dio.get("$COURSES_PATH/users",
          options: Options(headers: {"authorization": "Bearer $token "}),
          queryParameters: {'search': search.text});
      courses.clear();
      if (response.statusCode == 200) {
        Future.delayed(const Duration(milliseconds: 500), () {
          count_data.value = response.data['data']['count_data'];
          if (count_data.value != 0 && count_data % 3 != 0) {
            max_page.value = ((count_data / 3) + 3) as int;
          } else {
            max_page.value = (count_data.value / 3) as int;
          }
          for (var element in response.data["data"]['data']) {
            courses.add(c.Course.fromJson(element));
            courses.refresh();
          }
        });
      }
    } on DioError catch (e) {
      Get.snackbar(
          e.response!.statusCode.toString(), e.response!.data['message']);
    }
    update();
  }

  void getPayment(companyId) async {
    payments.clear();
    var sp = await SharedPreferences.getInstance();
    var token = sp.getString("access_token");
    var dio = Dio();
    try {
      final response = await dio.get(
          "$COMPANY_PAYMENT_PATH/$companyId/companies",
          options: Options(headers: {"authorization": "Bearer $token"}));
      if (response.statusCode == 200) {
        Future.delayed(const Duration(milliseconds: 500), () {
          for (var element in response.data["data"]) {
            payments.add(Payment.fromJson(element));
          }
        });
      }
    } on DioError catch (e) {
      Get.snackbar(e.response!.statusCode.toString(),
          e.response!.data['message']['message']);
    }
  }

  void join(companyId, courseId, paymentId) async {
    var sp = await SharedPreferences.getInstance();
    var token = sp.getString("access_token");
    var dio = Dio();
    try {
      final response = await dio.post(USER_COURSES_PATH,
          data: {
            "company_id": companyId,
            "course_id": courseId,
            "payment_id": paymentId
          },
          options: Options(headers: {"authorization": "Bearer $token"}));
      if (response.statusCode == 200) {
        Future.delayed(const Duration(milliseconds: 500), () {
          getUserCourse();
          // Get.snackbar("Success", "Please check your course",
          //     showProgressIndicator: true,
          //     isDismissible: true,
          //     overlayBlur: 10);
          Get.offNamed(Routes.HOME);
          selected_view.value = 1;
        });
      }
    } on DioError catch (e) {
      Get.snackbar(
          e.response!.statusCode.toString(), e.response!.data['message']);
    }
  }

  void getUserCourse() async {
    var dio = Dio();
    var sp = await SharedPreferences.getInstance();
    var token = await sp.getString("access_token");
    userCourses.clear();
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
        // Get.offAllNamed(Routes.HOME);
      }
    } on DioError catch (e) {
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
        role_id.refresh();
        Get.snackbar("Loading", "Please wait",
            showProgressIndicator: true, isDismissible: true, overlayBlur: 10);
        getCourse();
        getUserCourse();
      }
    });
    update();
  }

  void getPaymentDetail(id) async {
    var dio = Dio();
    try {
      final response = await dio.get("$PAYMENT_DETAIL_PATH/$id",
          options: await Helpers().headers());
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar("Loading", "Please wait",
            showProgressIndicator: true, isDismissible: false, overlayBlur: 10);
        payment_detail.value = pd.PaymentDetail.fromJson(response.data['data']);
        payment_detail.refresh();
        Future.delayed(Duration(seconds: 2), () {
          Get.to(PaymentDetailView(payment_detail.value));
        });
      }
      update();
    } on DioError catch (e) {
      Get.snackbar(
          e.response!.statusCode.toString(), e.response!.data['message']);
    }
  }

  void pay(id) async {
    var dio = Dio();
    Get.snackbar("Loading", "Your transaction is being processed",
        showProgressIndicator: true, isDismissible: false, overlayBlur: 10);
    try {
      final response = await dio.put("$PAYMENT_PAY_PATH/$id",
          options: await Helpers().headers());
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar(
            "Success", "Please contact the company to approve your request",
            showProgressIndicator: true, isDismissible: false, overlayBlur: 10);
        getUserCourse();
        Future.delayed(Duration(seconds: 2), () {
          Get.offNamedUntil(Routes.HOME, (route) => false);
        });
      }
      update();
    } on DioError catch (e) {
      Get.snackbar(
          e.response!.statusCode.toString(), e.response!.data['message']);
    }
  }

  onSearchChanged(String query) {
    courses.clear();
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      searchCourse();
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

  void increment() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      page.value++;
      page.refresh();
      update();
      getCourse();
    });
  }

  void decrement() {
    if (page.value != 1) {
      if (_debounce?.isActive ?? false) _debounce!.cancel();
      _debounce = Timer(const Duration(milliseconds: 500), () {
        page.value--;
        page.refresh();
        update();
        getCourse();
      });
    }
  }
}
