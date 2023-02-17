import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lesgo_mobile_dev/app/models/User_UserCourseModel.dart';
import 'package:lesgo_mobile_dev/app/modules/home/controllers/home_controller.dart';
import 'package:lesgo_mobile_dev/styles/colors.dart';
import 'package:lesgo_mobile_dev/styles/text.dart';

class ActiveLearningComponent extends StatelessWidget {
  UserCourse userCourses;
  ActiveLearningComponent(
    this.userCourses, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        var controller = Get.find<HomeController>();
        if (userCourses.isApproved == 0) {
          controller.getPaymentDetail(userCourses.id);
        }
      },
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  Container(
                    // color: Colors.grey,
                    width: 80,
                    height: 80,
                    child: Center(
                      // child: Image.network("https://docs.flutter.dev/assets/images/flutter-logo-sharing.png")
                      child: ClipRRect(
                        child: Image.network(
                            "https://docs.flutter.dev/assets/images/flutter-logo-sharing.png",
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        h7("course: ${userCourses.course!.name}"),
                        h7("Start: ${formatDate(DateTime.now(), [
                              dd,
                              ' ',
                              MM,
                              ' ',
                              yyyy
                            ])}"),
                        h7("End: ${formatDate(DateTime.now(), [
                              dd,
                              ' ',
                              MM,
                              ' ',
                              yyyy
                            ])}"),
                        Container(
                          width: 140,
                          height: 20,
                          decoration: BoxDecoration(
                              color: (userCourses.isApproved! == 0)
                                  ? BackgroundColor.grey
                                  : (userCourses.isApproved! == 1)
                                      ? BackgroundColor.orange
                                      : (userCourses.isApproved! == 2)
                                          ? BackgroundColor.green
                                          : BackgroundColor.red,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                            child: (h7(
                                (userCourses.isApproved! == 0)
                                    ? "Wating for Payment"
                                    : (userCourses.isApproved! == 1)
                                        ? "Waiting for Approval"
                                        : (userCourses.isApproved! == 2)
                                            ? "Approved"
                                            : "Rejected",
                                fw: FontWeight.w500,
                                tc: Colors.white)),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              thickness: 2,
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
