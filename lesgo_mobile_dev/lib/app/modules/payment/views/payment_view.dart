import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lesgo_mobile_dev/app/modules/payment/views/add_payment_view.dart';
import 'package:lesgo_mobile_dev/styles/colors.dart';
import 'package:lesgo_mobile_dev/styles/text.dart';

import '../components/payment_card.dart';
import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('PaymentView'),
          centerTitle: true,
        backgroundColor: BackgroundColor.blue,
        ),
        body: Obx(() {
          var controller = Get.find<PaymentController>();
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              child: Column(
                children: [
                  (controller.payments.value.isEmpty)
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Center(
                            child: h5("You dont have any payment!"),
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var payment in controller.payments)
                            PaymentCard(payment: payment)
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.symmetric(vertical: 8.0),
                              //   child: Container(
                              //     width: MediaQuery.of(context).size.width,
                              //     decoration: BoxDecoration(
                              //         borderRadius: BorderRadius.circular(12),
                              //         color: Color(0xffd9d9d9)),
                              //     padding:
                              //         const EdgeInsets.symmetric(vertical: 12),
                              //     child: Column(
                              //       crossAxisAlignment:
                              //           CrossAxisAlignment.start,
                              //       children: [
                              //         Padding(
                              //           padding: const EdgeInsets.symmetric(
                              //               horizontal: 8.0, vertical: 2),
                              //           child: h5(payment.providerService,
                              //               fw: FontWeight.w600),
                              //         ),
                              //         Padding(
                              //           padding: const EdgeInsets.symmetric(
                              //               horizontal: 8.0, vertical: 2),
                              //           child: h6(
                              //               "No VA: ${payment.accountNumber}",
                              //               fw: FontWeight.w500),
                              //         ),
                              //         Padding(
                              //           padding: const EdgeInsets.symmetric(
                              //               horizontal: 8.0, vertical: 2),
                              //           child: Row(
                              //             mainAxisAlignment:
                              //                 MainAxisAlignment.spaceBetween,
                              //             children: [
                              //               h6("Name: ${payment.name}",
                              //                   fw: FontWeight.w500),
                              //               InkWell(
                              //                 onTap: () {
                              //                   controller
                              //                       .deletePayment(payment.id);
                              //                 },
                              //                 child: Container(
                              //                   decoration: BoxDecoration(
                              //                       color:
                              //                           BackgroundColor.orange,
                              //                       borderRadius:
                              //                           BorderRadius.circular(
                              //                               8)),
                              //                   height: 24,
                              //                   width: 80,
                              //                   child: Center(
                              //                       child: h6("Delete",
                              //                           tc: Colors.white)),
                              //                 ),
                              //               )
                              //             ],
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                          ],
                        ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 0),
                    child: Container(
                      width: 140,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.to(() => AddPaymentView());
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            h6("Add Payment", tc: Colors.white),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }));
  }
}
