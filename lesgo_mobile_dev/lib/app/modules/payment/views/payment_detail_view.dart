import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lesgo_mobile_dev/app/models/PaymentDetailModel.dart';
import 'package:lesgo_mobile_dev/app/modules/home/controllers/home_controller.dart';
import 'package:lesgo_mobile_dev/styles/colors.dart';
import 'package:lesgo_mobile_dev/styles/text.dart';

class PaymentDetailView extends GetView {
  PaymentDetail paymendDetail;
  PaymentDetailView(this.paymendDetail, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('PaymentDetailView'),
        centerTitle: true,
        backgroundColor: BackgroundColor.blue,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 160,
                            decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(24),
                                color: Colors.white),
                            // child: Center(
                            //   child: h5(paymendDetail.course!.img ?? '-'),
                            // ),
                            child: Image.network(
                                "https://docs.flutter.dev/assets/images/flutter-logo-sharing.png"),
                          ),
                        ),
                        const Divider(
                          thickness: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 2),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        h6(
                                            paymendDetail
                                                    .course!.name ??
                                                '-',
                                            fw: FontWeight.w500),
                                        h6(
                                          paymendDetail.company?.name ?? '-',
                                          fw: FontWeight.w500,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 2),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.timer,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: h7(
                                          '${formatDate(DateTime.parse(paymendDetail.course!.startDate!.replaceAll('/', '-')), [
                                                dd,
                                                ' ',
                                                MM,
                                                ' ',
                                                yyyy
                                              ])} - ${formatDate(DateTime.parse(paymendDetail.course!.startDate!.replaceAll('/', '-')), [
                                                dd,
                                                ' ',
                                                MM,
                                                ' ',
                                                yyyy
                                              ])}',
                                          fw: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Text(
                                """Interaction designers are crucial because they build conversations that appear natural and human-like. Here we will discuss what it is, its dimensions and some provide examples. dsadsad dsadadasda dsafewf fewfwefewf ewfwe""",
                                maxLines: 10,
                                textAlign: TextAlign.justify,
                                // overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            h7("Transfer", fw: FontWeight.w600),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            h6('${paymendDetail.payment!.providerService} - ${paymendDetail.payment!.name}'),
                            h5( paymendDetail.payment!.accountNumber.toString(),
                                fw: FontWeight.w600,
                                tc: BackgroundColor.orange),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 10,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(color: Colors.grey, offset: Offset(0.0, 1.0))
                ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: h5(
                          NumberFormat.simpleCurrency(
                            locale: 'id',
                            name: 'Rp',
                          ).format(int.parse(paymendDetail.course!.price!)),
                          fw: FontWeight.w600,
                          tc: BackgroundColor.orange),
                    ),
                    MaterialButton(
                      height: 40,
                      minWidth: 100,
                      color: BackgroundColor.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      onPressed: () {
                        controller.pay(paymendDetail.id.toString());
                      },
                      child: h6("Pay", tc: Colors.white, fw: FontWeight.w600),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
