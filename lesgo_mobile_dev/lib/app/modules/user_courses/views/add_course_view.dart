import 'dart:io';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lesgo_mobile_dev/app/modules/user_courses/controllers/user_courses_controller.dart';
import 'package:lesgo_mobile_dev/styles/colors.dart';
import 'package:lesgo_mobile_dev/styles/text.dart';

class AddCourseView extends GetView {
  const AddCourseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<UserCoursesController>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('AddCourseView'),
          centerTitle: true,
        backgroundColor: BackgroundColor.blue,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12),
                    child: h7("Course name", fw: FontWeight.w500)),
                TextField(
                  controller: controller.name,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12),
                    child: h7("Course description", fw: FontWeight.w500)),
                TextField(
                  controller: controller.desc,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12),
                    child: h7("Kuota", fw: FontWeight.w500)),
                TextField(
                  controller: controller.quota,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12),
                    child: h7("Price", fw: FontWeight.w500)),
                TextField(
                  controller: controller.price,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                ),
                Obx(() {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      color: Color(0xffd9d9d9),
                      child: (controller.imageTemp.value.path == '')
                          ? Center(
                              child: Icon(Icons.photo),
                            )
                          : Image.file(controller.imageTemp.value),
                    ),
                  );
                }),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: MaterialButton(
                    onPressed: controller.pickImage,
                    child: h6("Pick Image"),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12),
                    child: h7("Started Date", fw: FontWeight.w500)),
                DateTimePicker(
                  controller: controller.startedDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12),
                    child: h7("End Date", fw: FontWeight.w500)),
                DateTimePicker(
                  controller: controller.endDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    color: Colors.lightBlue,
                    onPressed: controller.addCourse,
                    child: h6("Add", tc: Colors.white, fw: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 60,
                )
              ],
            ),
          ),
        ));
  }
}
