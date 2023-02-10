import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:get/get.dart';
import 'package:lesgo_mobile_dev/app/modules/payment/controllers/payment_controller.dart';
import 'package:lesgo_mobile_dev/styles/text.dart';

class AddPaymentView extends GetView {
  const AddPaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<PaymentController>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('AddPaymentView'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12),
                      child: h7("Provider Service", fw: FontWeight.w500)),
                  TextFormField(
                    validator: RequiredValidator(
                        errorText: 'Provider service cannot be empty'),
                    controller: controller.providerService,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12)))),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12),
                      child: h7("VA Number", fw: FontWeight.w500)),
                  TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(
                        errorText: "VA number cannot be empt"),
                        MinLengthValidator(10, errorText: "VA num length must be at least 10")
                    ]),
                    controller: controller.vaNum,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12)))),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12),
                      child: h7("Name", fw: FontWeight.w500)),
                  TextFormField(
                    onChanged: RequiredValidator(
                        errorText: "Name number cannot be empty"),
                    validator: RequiredValidator(
                        errorText: "Name number cannot be empty"),
                    controller: controller.name,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12)))),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: MaterialButton(
                        color: Colors.lightBlue,
                        onPressed: () {
                          if (controller.formKey.currentState!.validate()) {
                            controller.addPayment();
                          }
                        },
                        child: h6("Add Payment",
                            tc: Colors.white, fw: FontWeight.w500),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
