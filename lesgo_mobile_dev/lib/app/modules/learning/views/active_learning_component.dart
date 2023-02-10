import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:lesgo_mobile_dev/app/models/User_UserCourseModel.dart';
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
        print("Tapped");
      },
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                h6(userCourses.companyId.toString(), fw: FontWeight.w700)
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  Container(
                    color: Colors.grey,
                    width: 80,
                    height: 80,
                    child: Center(
                      child: Icon(Icons.photo),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        h7("course: ${userCourses.course!.courseTag!.name}"),
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
                              color: (userCourses.isApproved!)
                                  ? BackgroundColor.green
                                  : BackgroundColor.orange,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                            child: (h7(
                                (userCourses.isApproved!)
                                    ? "Approved"
                                    : "Waiting for Approval",
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
