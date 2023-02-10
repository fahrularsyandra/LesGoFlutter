import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:lesgo_mobile_dev/app/modules/home/components/learning_card.dart';
import 'package:lesgo_mobile_dev/app/routes/app_pages.dart';
import 'package:lesgo_mobile_dev/styles/text.dart';

import '../controllers/home_controller.dart';

class UserHomeView extends GetView<HomeController> {
  const UserHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: InkWell(
          onTap: () {
            // Get.toNamed(Routes.PROFILE);
          },
          child: Container(
            height: 450,
            color: Colors.yellow,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 32),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.blue,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: SizedBox(
                        height: 50, child: Center(child: h5("Hai, Admin!"))),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Color(0xffd9d9d9),
          child: Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 32, horizontal: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          h3("LesGo", ta: TextAlign.left),
                          h4("on a new journey", fw: FontWeight.w300)
                        ],
                      ),
                    ),
                    Obx(() {
                      return Container(
                        padding: const EdgeInsets.only(top: 48),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(32),
                                topRight: Radius.circular(32))),
                        child: (controller.courses.value.isNotEmpty)
                            ? Column(
                                children: [
                                  for (var i in controller.courses.value) LearningCard(i)
                                ],
                              )
                            : Center(
                                child: h4("There is no courses available"),
                              ),
                      );
                    }),
                  ],
                ),
              ),
              // Positioned(
              //   top: 112,
              //   right: 50,
              //   left: 50,
              //   child: Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(12),
              //       color: Colors.white,
              //     ),
              //     child: TextField(
              //       decoration: InputDecoration(
              //           suffixIcon: Padding(
              //             padding: const EdgeInsets.only(right: 8.0),
              //             child: Container(
              //               decoration: BoxDecoration(
              //                   color: Color(0xffd9d9d9),
              //                   borderRadius: BorderRadius.circular(12)),
              //               child: IconButton(
              //                 icon: Icon(Icons.search),
              //                 onPressed: () {
              //                   print("search tapped");
              //                 },
              //               ),
              //             ),
              //           ),
              //           hintText: "Search",
              //           border: OutlineInputBorder(
              //               borderRadius:
              //                   BorderRadius.all(Radius.circular(12)))),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}




          //  Positioned(
          //   top: 100,
          //     width: 320,
          //     child: Align(
          //       alignment: Alignment.centerRight,
          //       child: TextField(
          //         decoration: InputDecoration(
          //             hintText: "Search",
          //             border: OutlineInputBorder(
          //                 borderRadius: BorderRadius.all(Radius.circular(12)))),
          //       ),
          //     ),
          //   ),