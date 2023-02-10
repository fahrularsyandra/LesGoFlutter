import 'package:get/get.dart';
import 'package:lesgo_mobile_dev/app/modules/learning/controllers/learning_controller.dart';
import 'package:lesgo_mobile_dev/app/modules/profile/controllers/profile_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<LearningController>(
      () => LearningController(),
    );
  }
}
