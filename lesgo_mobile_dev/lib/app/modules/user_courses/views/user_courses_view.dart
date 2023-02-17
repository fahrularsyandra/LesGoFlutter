import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lesgo_mobile_dev/app/models/UserCourseModel.dart';
import 'package:lesgo_mobile_dev/const.dart';
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
        backgroundColor: BackgroundColor.blue,
        ),
        body: SingleChildScrollView(
          child: Obx(() {
            var courseDetail = controller.courseDetail.value;
            return Container(
              color: Colors.white,
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
                        child: Image.network(
                          (courseDetail.img != null)
                              ? '$IMAGE_PATH/course/${courseDetail.img}'
                              : 'http://akuntansi.upi.edu/images/no-photos.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        h6(courseDetail.name ?? '-', fw: FontWeight.w500),
                        h6(courseDetail.company?.name ?? '-',
                            fw: FontWeight.w500),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            h7("Description", fw: FontWeight.w600),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Text(
                                """Interaction designers are crucial because they build conversations that appear natural and human-like. Here we will discuss what it is, its dimensions and some provide examples. dsadsad dsadadasda dsafewf fewfwefewf ewfwe""",
                                maxLines: 4,
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        h7("Participants", fw: FontWeight.w600),
                      ],
                    ),
                  ),
                  (controller.userCourses.value.isEmpty)
                      ? Container(
                          child: Center(
                            child: h5("There is no participant!"),
                          ),
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
