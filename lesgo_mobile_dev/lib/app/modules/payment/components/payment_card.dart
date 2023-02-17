import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lesgo_mobile_dev/app/modules/payment/controllers/payment_controller.dart';
import 'package:lesgo_mobile_dev/styles/colors.dart';
import 'package:lesgo_mobile_dev/styles/text.dart';

import '../../../models/PaymentModel.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    super.key,
    required this.payment,
    // required this.controller,
  });

  final Payment payment;
  // final PaymentController controller;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<PaymentController>();
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white),
        padding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0, vertical: 2),
              child: h5(payment.providerService,
                  fw: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0, vertical: 2),
              child: h6(
                  "No VA: ${payment.accountNumber}",
                  fw: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0, vertical: 2),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  h6("Name: ${payment.name}",
                      fw: FontWeight.w500),
                  InkWell(
                    onTap: () {
                      controller
                          .deletePayment(payment.id);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color:
                              BackgroundColor.orange,
                          borderRadius:
                              BorderRadius.circular(
                                  8)),
                      height: 24,
                      width: 80,
                      child: Center(
                          child: h6("Delete",
                              tc: Colors.white)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
