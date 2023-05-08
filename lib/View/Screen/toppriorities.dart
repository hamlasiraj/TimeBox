import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timebox/Controller/topprioritiescontroller.dart';
import 'package:timebox/Core/Constant/colors.dart';

import '../Widget/button.dart';
import '../Widget/textfield.dart';

class TopPriorities extends StatelessWidget {
  const TopPriorities({super.key});

  @override
  Widget build(BuildContext context) {
    TopPrioritiesControllerImp controller =
        Get.put(TopPrioritiesControllerImp());
    return Scaffold(
        bottomNavigationBar: CustomButton(
          hint: "Next",
          onPressed: () {
            controller.goToTimeBoxing();
          },
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: AppColor.secondaryColor,
          title: const Text(
            "Top Priorities",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: "Roboto",
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Form(
                child: Column(
                  children: [
                    CusttomTextField(
                        controller: controller.firstP,
                        maxLines: 2,
                        hintText: "First Priority"),
                    SizedBox(height: 10),
                    CusttomTextField(
                        controller: controller.secondP,
                        maxLines: 2,
                        hintText: "Second Priority"),
                    SizedBox(height: 10),
                    CusttomTextField(
                      controller: controller.thirdP,
                      maxLines: 2,
                      hintText: "Third Priority",
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
