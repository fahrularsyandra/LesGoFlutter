import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lesgo_mobile_dev/app/modules/profile/controllers/profile_controller.dart';
import 'package:lesgo_mobile_dev/const.dart';
import 'package:lesgo_mobile_dev/styles/colors.dart';
import 'package:lesgo_mobile_dev/styles/text.dart';

class EditProfileView extends GetView<ProfileController> {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    controller.initEdit(Get.arguments);
    return Scaffold(
        appBar: AppBar(
          title: const Text('EditProfileView'),
          centerTitle: true,
        backgroundColor: BackgroundColor.blue,
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12),
                    child: h7("Username", fw: FontWeight.w500)),
                TextField(
                  controller: controller.username,
                  onChanged: (value) {
                    controller.check(Get.arguments);
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    color: Color(0xffd9d9d9),
                    child: (controller.imageTemp.value.path == '')
                        ? Container(
                            width: 100,
                            height: 100,
                            child: Image.network((Get.arguments['profile']
                                        ['img'] !=
                                    null)
                                ? '$IMAGE_PATH/profile/${Get.arguments['profile']['img']}'
                                : 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/No_image_available_600_x_450.svg/1280px-No_image_available_600_x_450.svg.png'),
                          )
                        : Image.file(controller.imageTemp.value),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: MaterialButton(
                    onPressed: controller.pickImage,
                    child: h6("Pick Image"),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                  child: h7("Age", fw: FontWeight.w500),
                ),
                TextField(
                  controller: controller.age,
                  onChanged: (value) {
                    controller.check(Get.arguments);
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12),
                    child: h7("Address", fw: FontWeight.w500)),
                TextField(
                  controller: controller.address,
                  onChanged: (value) {
                    controller.check(Get.arguments);
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                ),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    color: BackgroundColor.blue,
                    disabledColor: BackgroundColor.grey,
                    minWidth: 400,
                    onPressed: (controller.editFlag.value) ? () {
                      controller.editProfile();
                    } : null,
                    child: h5("Edit", fw: FontWeight.w500, tc: Colors.white),
                  ),
                ))
              ],
            );
          }),
        )));
  }
}
