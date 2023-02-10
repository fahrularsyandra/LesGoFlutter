import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lesgo_mobile_dev/app/models/CourseModel.dart';
import 'package:lesgo_mobile_dev/app/modules/home/controllers/home_controller.dart';
import 'package:lesgo_mobile_dev/app/modules/learning/views/course_detail_view.dart';
import 'package:lesgo_mobile_dev/app/routes/app_pages.dart';
import 'package:lesgo_mobile_dev/styles/text.dart';
import 'package:intl/intl.dart';

class LearningCard extends StatelessWidget {
  Course course;
  LearningCard(
    this.course, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        var controller = Get.find<HomeController>();
        if (controller.role_id == 2) {
          Get.toNamed(Routes.USER_COURSES, arguments: {
            "company_id": course.courseTag!.companyId,
            "course_id": course.id
          });
        } else {
          controller.getPayment(course.courseTag!.companyId);
          Get.to(() => CourseDetailView(course));
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xfff4f4f4)),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 6),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: Color(0xffd9d9d9),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  )),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6.0, right: 12),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      height: 100,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                h6(course.description, fw: FontWeight.w600),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    h9(course.courseTag!.name,
                                        fw: FontWeight.w500),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2.0),
                                      child: h8("|", fw: FontWeight.w500),
                                    ),
                                    Row(
                                      children: [
                                        h9(
                                            formatDate(
                                                DateTime.parse(course.startDate!
                                                    .replaceAll('/', "-")),
                                                [dd, " ", M, " ", yyyy]),
                                            fw: FontWeight.w500),
                                        h9(" - ", fw: FontWeight.w500),
                                        h9(
                                            formatDate(
                                                DateTime.parse(course.endDate!
                                                    .replaceAll('/', "-")),
                                                [dd, " ", M, " ", yyyy]),
                                            fw: FontWeight.w500),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                h8("Kuota: "),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 8),
                                  child: Container(
                                    height: 18,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Color(0xff258F00),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Center(
                                        child: h9("Available",
                                            fw: FontWeight.w700,
                                            tc: Colors.white)),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                h8("Price: "),
                                h8(NumberFormat.currency(
                                        locale: "id", name: "Rp. ")
                                    .format(int.parse(course.price!)))
                              ],
                            )
                          ]),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
