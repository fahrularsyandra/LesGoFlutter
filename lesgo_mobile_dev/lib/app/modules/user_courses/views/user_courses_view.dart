import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lesgo_mobile_dev/app/models/UserCourseModel.dart';
import 'package:lesgo_mobile_dev/styles/colors.dart';
import 'package:lesgo_mobile_dev/styles/text.dart';

import '../components/user_course_card.dart';
import '../controllers/user_courses_controller.dart';

class UserCoursesView extends GetView<UserCoursesController> {
  const UserCoursesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<UserCoursesController>();
    controller.getUserCourses(Get.arguments);
    return Scaffold(
        appBar: AppBar(
          title: const Text('UserCoursesView'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Obx(() {
            var courseTag = controller.courseTag.value;
            var courseDetail = controller.courseDetail.value;
            return Container(
              color: Colors.grey[200],
              // padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 160,
                      decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(24),
                          color: Colors.white),
                      child: Center(
                        child: h5(controller.courseDetail.value.img ?? '-'),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        h6(courseTag.name ?? '-', fw: FontWeight.w500),
                        h6(courseTag.company?.name ?? '-', fw: FontWeight.w500),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2),
                    child: Row(
                      children: [
                        h7(courseDetail.description ?? '-', fw: FontWeight.w500),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        h5("Participants", fw: FontWeight.w500),
                      ],
                    ),
                  ),
                  (controller.userCourses.value.isEmpty)
                      ? Container(
                        child: Center(child: h5("There is no participant!"),),
                      )
                      : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (var e in controller.userCourses.value)
                              UserCourseCard(userCourse: e),
                          ],
                        )
                ],
              ),
            );
          }),
        ));
  }
}
