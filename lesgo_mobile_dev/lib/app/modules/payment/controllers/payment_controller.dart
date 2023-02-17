import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lesgo_mobile_dev/app/models/PaymentDetailModel.dart';
import 'package:lesgo_mobile_dev/app/models/PaymentModel.dart' as p;
import 'package:lesgo_mobile_dev/app/routes/app_pages.dart';
import 'package:lesgo_mobile_dev/const.dart';
import 'package:lesgo_mobile_dev/helpers/helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentController extends GetxController {
  //TODO: Implement PaymentController

  var payments = <p.Payment>[].obs;

  var providerService = TextEditingController();
  var vaNum = TextEditingController();
  var name = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var payment_detail = PaymentDetail().obs;

  final count = 0.obs;

  @override
  void onInit() {
    getPayment();
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

  void getPayment() async {
    var dio = Dio();
    payments.clear();
    var sp = await SharedPreferences.getInstance();
    await sp.reload();
    var roleId = sp.getInt("role_id");
    var company_id = sp.getInt('company_id');
    if (roleId == 2) {
      try {
        final response = await dio.get('${COMPANY_PAYMENT_PATH}/${company_id}/companies',
            options: await Helpers().headers());
        if (response.statusCode == 200) {
          for (var data in response.data['data']) {
            payments.add(p.Payment.fromJson(data));
            payments.refresh();
          }
        }
      } on DioError catch (e) {
        Get.snackbar(
            e.response!.statusCode.toString(), e.response!.data['message']);
      }
      update();
    }
  }

  void addPayment() async {
    var dio = Dio();
    var sp = await SharedPreferences.getInstance();
    var company_id = sp.getInt('company_id');
    try {
      final response = await dio.post(COMPANY_PAYMENT_PATH,
          data: {
            "provider_service": providerService.text,
            "account_number": int.parse(vaNum.text),
            "name": name.text,
            "company_id": company_id
          },
          options: await Helpers().headers());
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar("Success", "Your payment has been created!",
            showProgressIndicator: true, isDismissible: true, overlayBlur: 10);
        getPayment();
        Get.offNamedUntil(Routes.HOME, (route) => false);
      }
    } on DioError catch (e) {
      Get.snackbar(
          e.response!.statusCode.toString(), e.response!.data['message']);
    }
  }

  void deletePayment(id) async {
    var dio = Dio();
    try {
      final response = await dio.delete("$COMPANY_PAYMENT_PATH/$id",
          options: await Helpers().headers());
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar("Success", "Payment has been deleted!",
            showProgressIndicator: true, isDismissible: true, overlayBlur: 10);
        getPayment();
        Get.offNamedUntil(Routes.HOME, (route) => false);
      }
    } on DioError catch (e) {
      Get.snackbar(
          e.response!.statusCode.toString(), e.response!.data['message']);
    }
  }

  void getPaymentDetail(id) async{
    var dio = Dio();
    try {
      final response = await dio.get("$PAYMENT_DETAIL_PATH/$id",
          options: await Helpers().headers());
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar("Loading", "Please wait",
            showProgressIndicator: true, isDismissible: false, overlayBlur: 10);
          payment_detail.value = response.data['data'];
          payment_detail.refresh();
      }
      update();
    } on DioError catch (e) {
      Get.snackbar(
          e.response!.statusCode.toString(), e.response!.data['message']);
    }
  }

  void increment() => count.value++;
}
