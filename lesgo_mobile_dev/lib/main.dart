import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sp = await SharedPreferences.getInstance();
  final token = sp.getString('access_token');
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: (token == null) ? AppPages.INITIAL : Routes.HOME,
      getPages: AppPages.routes,
    ),
  );
}
