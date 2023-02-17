import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lesgo_mobile_dev/app/modules/payment/views/payment_detail_view.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/navigation_bar_view.dart';
import '../modules/learning/bindings/learning_binding.dart';
import '../modules/learning/views/learning_view.dart';
import '../modules/payment/bindings/payment_binding.dart';
import '../modules/payment/views/payment_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/user_courses/bindings/user_courses_binding.dart';
import '../modules/user_courses/views/add_course_view.dart';
import '../modules/user_courses/views/user_courses_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      binding: HomeBinding(),
      page: () => const NavigationBarView(),
    ),
    GetPage(
      name: _Paths.AUTH,
      binding: AuthBinding(),
      page: () => const AuthView(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      binding: ProfileBinding(),
      page: () => const ProfileView(),
    ),
    GetPage(
      name: _Paths.LEARNING,
      binding: LearningBinding(),
      page: () => const LearningView(),
    ),
    GetPage(
      name: _Paths.USER_COURSES,
      binding: UserCoursesBinding(),
      page: () => const UserCoursesView(),
    ),
    GetPage(
      name: _Paths.ADD_USER_COURSES,
      binding: UserCoursesBinding(),
      page: () => const AddCourseView(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      binding: PaymentBinding(),
      page: () => const PaymentView(),
    ),
    // GetPage(
    //   name: _Paths.PAYMENT_DETAIL,
    //   binding: PaymentBinding(),
    //   page: () => const PaymentDetailView(),
    // ),
  ];
}
