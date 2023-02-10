import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lesgo_mobile_dev/app/modules/home/components/learning_card.dart';
import 'package:lesgo_mobile_dev/app/modules/home/controllers/home_controller.dart';
import 'package:lesgo_mobile_dev/app/modules/user_courses/views/add_course_view.dart';
import 'package:lesgo_mobile_dev/app/routes/app_pages.dart';
import 'package:lesgo_mobile_dev/styles/text.dart';

class PartnerHomeView extends GetView {
  const PartnerHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PartnerHomeView'),
        centerTitle: true,
      ),
      // floatingActionButton: InkWell(
      //   child: Container(
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(30),
      //       color: Colors.lightBlue,
      //     ),
      //     width: 80,
      //     height: 80,
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         Icon(Icons.add, color: Colors.white,),
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: h8("Add Course", tc: Colors.white, fw: FontWeight.w600),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(child: Container(
        child: Obx(() {
          var controller = Get.find<HomeController>();
          return Column(
            children: [
              for (var course in controller.courses.value) LearningCard(course),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.ADD_USER_COURSES);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    width: 100,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        h8("Add Course", tc: Colors.white, fw: FontWeight.w600),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        }),
      )),
    );
  }
}
