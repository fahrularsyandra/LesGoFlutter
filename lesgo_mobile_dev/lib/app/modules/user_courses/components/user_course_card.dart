import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lesgo_mobile_dev/app/modules/user_courses/controllers/user_courses_controller.dart';
import 'package:lesgo_mobile_dev/styles/text.dart';

import '../../../../styles/colors.dart';
import '../../../models/UserCourseModel.dart';

class UserCourseCard extends StatelessWidget {
  const UserCourseCard({
    super.key,
    required this.userCourse,
  });

  final UserCourse userCourse;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        // height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            h6("Name: ${userCourse.user!.username}"),
            h6("Email: ${userCourse.user!.email}"),
            Row(
              children: [
                h6("Status : "),
                (userCourse.isApproved!)
                    ? h6("Approved", tc: BackgroundColor.green)
                    : h6("Waiting for Approval", tc: BackgroundColor.orange)
              ],
            ),
            SizedBox(
              height: 40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: MaterialButton(
                      height: 24,
                      minWidth: 140,
                      disabledColor: Colors.black54,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      color: BackgroundColor.green,
                      onPressed: (!userCourse.isApproved!)
                          ? () {
                              var controller =
                                  Get.find<UserCoursesController>();
                              controller.approveUser(
                                  userCourse.id, userCourse.courseId);
                            }
                          : null,
                      child:
                          h7("Approved", fw: FontWeight.w500, tc: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: MaterialButton(
                      disabledColor: Colors.black54,
                      height: 24,
                      minWidth: 140,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      color: BackgroundColor.orange,
                      onPressed: (!userCourse.isApproved!) ? () {} : null,
                      child:
                          h7("Reject", fw: FontWeight.w500, tc: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
