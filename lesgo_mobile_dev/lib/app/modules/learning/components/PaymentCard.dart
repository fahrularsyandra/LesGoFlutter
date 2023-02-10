import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lesgo_mobile_dev/app/models/PaymentModel.dart';
import 'package:lesgo_mobile_dev/app/modules/home/controllers/home_controller.dart';
import 'package:lesgo_mobile_dev/styles/text.dart';

class PaymentCard extends StatelessWidget {
  Payment payment;
  int company_id;
  int course_id;
  PaymentCard(
    this.payment, this.company_id, this.course_id,{
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        var controller = Get.find<HomeController>();
        controller.selected_payment.value = payment;
        controller.join(company_id, course_id, payment.id);
        Get.back();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Container(
                width: 130,
                height: 100,
                color: Color(0xffd9d9d9),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  h6("BCA"),
                  h6("VA: 2132132132131231"),
                  h6("Aditya Bagaskara"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
