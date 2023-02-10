import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lesgo_mobile_dev/app/models/CourseModel.dart';
import 'package:lesgo_mobile_dev/app/modules/home/controllers/home_controller.dart';
import 'package:lesgo_mobile_dev/app/modules/learning/components/PaymentCard.dart';
import 'package:lesgo_mobile_dev/styles/colors.dart';
import 'package:lesgo_mobile_dev/styles/text.dart';

class CourseDetailView extends GetView {
  Course course;
  CourseDetailView(this.course, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('CourseDetailView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
                        child: h5(course.img ?? '-'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        h6(course.courseTag!.name ?? '-', fw: FontWeight.w500),
                        h6(
                          course.courseTag!.company?.name ?? '-',
                          fw: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        h7(course.description ?? '-', fw: FontWeight.w500),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: BackgroundColor.purple
                          ),
                          width: 140,
                          height: 24,
                          child: Center(
                            child: h7(
                                NumberFormat.simpleCurrency(
                                  locale: 'id',
                                  name: 'Rp. ',
                                ).format(int.parse(course.price!)),
                                fw: FontWeight.w600, tc: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        h7(
                            'Start date: ${formatDate(DateTime.parse(course.startDate!.replaceAll('/', '-')), [
                                  dd,
                                  ' ',
                                  MM,
                                  ' ',
                                  yyyy
                                ])}',
                            fw: FontWeight.w500),
                        h7(
                            'End date: ${formatDate(DateTime.parse(course.startDate!.replaceAll('/', '-')), [
                                  dd,
                                  ' ',
                                  MM,
                                  ' ',
                                  yyyy
                                ])}',
                            fw: FontWeight.w500),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 2),
                    child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: BackgroundColor.orange
                          ),
                          width: 140,
                          height: 32,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          h5(
                              'Quota: ${course.quota}',
                              fw: FontWeight.w600, tc: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 50,)
                ],
              ),
            ),
            MaterialButton(
              height: 40,
              minWidth: 300,
              color: BackgroundColor.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              onPressed: () {
                print(controller.payments);
                print("join tapped");

                Get.bottomSheet(Container(
                  // height: 300,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      for (var e in controller.payments)
                        PaymentCard(e, course.courseTag!.companyId!, course.id!)
                    ],
                  ),
                ));
              },
              child: h5("Join", tc: Colors.white, fw: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
