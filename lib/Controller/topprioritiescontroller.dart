import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timebox/Core/Constant/routes.dart';

import '../Core/Constant/colors.dart';

abstract class TopPrioritiesController extends GetxController {
  goToTimeBoxing();
}

class TopPrioritiesControllerImp extends TopPrioritiesController {
  //
  TextEditingController firstP = TextEditingController();
  TextEditingController secondP = TextEditingController();
  TextEditingController thirdP = TextEditingController();

  String? thoughts;

//
  @override
  goToTimeBoxing() {
    Get.defaultDialog(
        title: "Advice",
        titleStyle:
            const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        backgroundColor: AppColor.primaryColor,
        buttonColor: AppColor.secondaryColor,
        confirmTextColor: AppColor.black,
        cancelTextColor: AppColor.black,
        textConfirm: "Yes",
        onConfirm: () {
          Get.toNamed(AppRoutes.timeBoxing, arguments: {
            "thoughts": thoughts,
            "firstP": firstP.text,
            "secondP": secondP.text,
            "thirdP": thirdP.text
          });
          print("$thoughts");
        },
        textCancel: "No",
        content: const Text(
          "Make sure that those are the most important goal for this day.",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w600),
        ));
  }

  @override
  void onInit() {
    thoughts = Get.arguments["thoughts"];
    firstP = TextEditingController();
    secondP = TextEditingController();
    thirdP = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    firstP.dispose();
    secondP.dispose();
    thirdP.dispose();
    super.dispose();
  }
}
