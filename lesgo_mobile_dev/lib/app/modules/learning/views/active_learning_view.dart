import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:get/get.dart';
import 'package:lesgo_mobile_dev/app/modules/home/controllers/home_controller.dart';
import 'package:lesgo_mobile_dev/app/modules/learning/views/active_learning_component.dart';
import 'package:lesgo_mobile_dev/styles/text.dart';

class ActiveLearningView extends GetView {
  ActiveLearningView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  var controller = Get.find<HomeController>();
    return SingleChildScrollView(
      child: Obx(() {
          return (controller.userCourses.value.isNotEmpty)?Container(
            padding: const EdgeInsets.symmetric(vertical: 16,),
            child: Column(
              children: [
                for(var element in controller.userCourses.value) ActiveLearningComponent(element)
              ],
            ),
          ) : Center(child: h4("You don't have any courses"),);
        }
      )
    );
  }
}

