import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timebox/Core/Constant/colors.dart';
import 'package:timebox/Core/Constant/routes.dart';

abstract class BrainDumpController extends GetxController {
  goToTopPriorities();
}

class BrainDumpControllerImp extends BrainDumpController {
//
  TextEditingController thoughts = TextEditingController();

//
  @override
  goToTopPriorities() {
    Get.defaultDialog(
        titleStyle:
            const TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
        backgroundColor: AppColor.primaryColor,
        buttonColor: AppColor.secondaryColor,
        confirmTextColor: AppColor.black,
        cancelTextColor: AppColor.black,
        textConfirm: "Yes",
        onConfirm: () {
          Get.toNamed(AppRoutes.topPriorities,
              arguments: {"thoughts": thoughts.text});
          print("${thoughts.text}");
        },
        textCancel: "No",
        content: const Text(
          "Are sure that you write everything?",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w600),
        ));
  }

  @override
  void onInit() {
    thoughts = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    thoughts.dispose();
    super.dispose();
  }
}
