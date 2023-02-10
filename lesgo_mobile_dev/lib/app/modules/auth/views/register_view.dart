import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lesgo_mobile_dev/app/modules/auth/controllers/auth_controller.dart';
import 'package:lesgo_mobile_dev/styles/text.dart';

class RegisterView extends GetView {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AuthController());
    var controller = Get.find<AuthController>();
    var _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              color: Color(0xfff0f0f0),
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8),
                          child: h5("Register"))
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.black,
                    indent: 4,
                    endIndent: 2,
                    height: 2,
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 12),
                            child: h7("Username")),
                        TextField(
                          controller: controller.username,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)))),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 12),
                            child: h7("Email")),
                        TextField(
                          controller: controller.email,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)))),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 12),
                            child: h7("Password", fw: FontWeight.w500)),
                        TextField(
                          controller: controller.password,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)))),
                          obscureText: true,
                        ),
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(
                            color: Color(0xffd9d9d9),
                            minWidth: 400,
                            onPressed: () {
                              controller.register();
                            },
                            child: h5("REGISTER", fw: FontWeight.w500),
                          ),
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
