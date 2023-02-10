import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lesgo_mobile_dev/app/modules/learning/controllers/learning_controller.dart';
import 'package:lesgo_mobile_dev/app/modules/payment/controllers/payment_controller.dart';
import 'package:lesgo_mobile_dev/app/modules/profile/controllers/profile_controller.dart';

import '../controllers/home_controller.dart';

class NavigationBarView extends GetView<HomeController> {
  const NavigationBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    return Obx(() {
      Get.put(ProfileController());
      (controller.role_id.value == 3)
          ? Get.put(LearningController())
          : Get.put(PaymentController());
      return Scaffold(
        body: (controller.role_id.value == 3)
            ? controller.userViews.elementAt(controller.selected_view.value)
            : controller.partnerViews.elementAt(controller.selected_view.value),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.yellow[800],
          unselectedItemColor: Color(0xffd9d9d9d9),
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            (controller.role_id.value == 3)
                ? const BottomNavigationBarItem(
                    icon: Icon(Icons.school),
                    label: 'Learning',
                  )
                : const BottomNavigationBarItem(
                    icon: Icon(Icons.payment),
                    label: 'Payment',
                  ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: controller.selected_view.value,
          onTap: controller.navigation,
        ),
      );
    });
  }
}
