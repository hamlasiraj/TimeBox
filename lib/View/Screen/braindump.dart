import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timebox/Controller/braindumpcontroller.dart';
import 'package:timebox/Core/Constant/colors.dart';

import '../Widget/button.dart';

class BrainDump extends StatelessWidget {
  const BrainDump({super.key});

  @override
  Widget build(BuildContext context) {
    BrainDumpControllerImp controller = Get.put(BrainDumpControllerImp());
    return Scaffold(
      bottomNavigationBar: CustomButton(
        hint: "Next",
        onPressed: () {
          controller.goToTopPriorities();
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.secondaryColor,
        title: const Text(
          "Brain Dump",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto",
          ),
        ),
      ),
      body: Column(children: [
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Form(
              child: TextField(
                controller: controller.thoughts,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: "Write your thoughts...",
                  border: InputBorder.none,
                  helperMaxLines: 3,
                ),
                maxLines: 30,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
