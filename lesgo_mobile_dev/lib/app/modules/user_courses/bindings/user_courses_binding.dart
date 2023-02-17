import 'package:get/get.dart';

import '../controllers/user_courses_controller.dart';

class UserCoursesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserCoursesController>(
      () {
        return UserCoursesController();
      },
    );
  }
}
