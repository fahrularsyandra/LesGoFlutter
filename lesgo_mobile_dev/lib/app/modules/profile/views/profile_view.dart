import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lesgo_mobile_dev/app/modules/profile/views/edit_profile_view.dart';
import 'package:lesgo_mobile_dev/const.dart';
import 'package:lesgo_mobile_dev/styles/colors.dart';
import 'package:lesgo_mobile_dev/styles/text.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var controller = Get.find<ProfileController>();
    return Obx(() {
      var controller = Get.find<ProfileController>();
      var user = controller.user.value;
      var company = controller.company.value;
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(240),
          child: Container(
            color: BackgroundColor.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 32,
                ),
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.green),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.network(
                          (controller.user.value.roleId == 3)
                              ? (controller.user.value.profile!.img != null)
                                  ? '$IMAGE_PATH/profile/${controller.user.value.profile!.img}'
                                  : 'https://w7.pngwing.com/pngs/223/244/png-transparent-computer-icons-avatar-user-profile-avatar-heroes-rectangle-black.png'
                              : (controller.company.value.img != null)
                                  ? '$IMAGE_PATH/company/${controller.company.value.img}'
                                  : 'https://w7.pngwing.com/pngs/223/244/png-transparent-computer-icons-avatar-user-profile-avatar-heroes-rectangle-black.png',
                          fit: BoxFit.fill)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: h3(controller.user.value.username ?? "admin",
                      fw: FontWeight.w500, tc: Colors.white),
                ),
                (controller.company.value.id != null)
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: (controller.company.value.isApproved!)
                              ? BackgroundColor.green
                              : BackgroundColor.orange,
                        ),
                        height: 40,
                        width: 180,
                        child: Center(
                          child: h6(
                              (controller.company.value.isApproved!)
                                  ? 'Approved'
                                  : 'Waiting for Approval',
                              fw: FontWeight.w500,
                              tc: Colors.white),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0, vertical: 18),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 4,
                                          child: h6("Email",
                                              ta: TextAlign.left,
                                              fw: FontWeight.w500)),
                                      Expanded(
                                          flex: 1,
                                          child: h6(":",
                                              ta: TextAlign.left,
                                              fw: FontWeight.w500)),
                                      Expanded(
                                          flex: 7,
                                          child: h6("${user.email}",
                                              ta: TextAlign.left,
                                              fw: FontWeight.w500)),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  thickness: 1,
                                  color: Colors.black,
                                  indent: 4,
                                  endIndent: 2,
                                  height: 2,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      if (user.roleId == 2)
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4.0, vertical: 18),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 4,
                                                child: h6("Company",
                                                    ta: TextAlign.left,
                                                    fw: FontWeight.w500)),
                                            Expanded(
                                                flex: 1,
                                                child: h6(":",
                                                    ta: TextAlign.left,
                                                    fw: FontWeight.w500)),
                                            Expanded(
                                                flex: 7,
                                                child: h6(
                                                    "${company.name ?? '-'}",
                                                    ta: TextAlign.left,
                                                    fw: FontWeight.w500)),
                                          ],
                                        ),
                                      ),
                                      const Divider(
                                        thickness: 1,
                                        color: Colors.black,
                                        indent: 4,
                                        endIndent: 2,
                                        height: 2,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4.0, vertical: 18),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 4,
                                                child: h6("Phone",
                                                    ta: TextAlign.left,
                                                    fw: FontWeight.w500)),
                                            Expanded(
                                                flex: 1,
                                                child: h6(":",
                                                    ta: TextAlign.left,
                                                    fw: FontWeight.w500)),
                                            Expanded(
                                                flex: 7,
                                                child: h6(
                                                    "${company.phone ?? '-'}",
                                                    ta: TextAlign.left,
                                                    fw: FontWeight.w500)),
                                          ],
                                        ),
                                      ),
                                      const Divider(
                                        thickness: 1,
                                        color: Colors.black,
                                        indent: 4,
                                        endIndent: 2,
                                        height: 2,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4.0, vertical: 18),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 4,
                                                child: h6("Address",
                                                    ta: TextAlign.left,
                                                    fw: FontWeight.w500)),
                                            Expanded(
                                                flex: 1,
                                                child: h6(":",
                                                    ta: TextAlign.left,
                                                    fw: FontWeight.w500)),
                                            Expanded(
                                                flex: 7,
                                                child: h6(
                                                    "${company.address ?? '-'}",
                                                    ta: TextAlign.left,
                                                    fw: FontWeight.w500)),
                                          ],
                                        ),
                                      ),
                                      const Divider(
                                        thickness: 1,
                                        color: Colors.black,
                                        indent: 4,
                                        endIndent: 2,
                                        height: 2,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      if (user.roleId == 3)
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4.0, vertical: 18),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 4,
                                                child: h6("Username",
                                                    ta: TextAlign.left,
                                                    fw: FontWeight.w500)),
                                            Expanded(
                                                flex: 1,
                                                child: h6(":",
                                                    ta: TextAlign.left,
                                                    fw: FontWeight.w500)),
                                            Expanded(
                                                flex: 7,
                                                child: h6("${user.username}",
                                                    ta: TextAlign.left,
                                                    fw: FontWeight.w500)),
                                          ],
                                        ),
                                      ),
                                      const Divider(
                                        thickness: 1,
                                        color: Colors.black,
                                        indent: 4,
                                        endIndent: 2,
                                        height: 2,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4.0, vertical: 18),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 4,
                                                child: h6("Address",
                                                    ta: TextAlign.left,
                                                    fw: FontWeight.w500)),
                                            Expanded(
                                                flex: 1,
                                                child: h6(":",
                                                    ta: TextAlign.left,
                                                    fw: FontWeight.w500)),
                                            Expanded(
                                                flex: 7,
                                                child: h6(
                                                    "${user.profile!.address}",
                                                    ta: TextAlign.left,
                                                    fw: FontWeight.w500)),
                                          ],
                                        ),
                                      ),
                                      const Divider(
                                        thickness: 1,
                                        color: Colors.black,
                                        indent: 4,
                                        endIndent: 2,
                                        height: 2,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: MaterialButton(
                          color: BackgroundColor.turqoise,
                          onPressed: () {
                            Get.to(() => EditProfileView(),
                                arguments: controller.user.value.toJson());
                          },
                          child: h6('Edit Profile',
                              tc: Colors.white, fw: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 12,
                left: 20,
                right: 20,
                child: InkWell(
                  onTap: () {
                    controller.logout();
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: BackgroundColor.red,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                        child: h5("Logout",
                            tc: Colors.white, fw: FontWeight.w600)),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
