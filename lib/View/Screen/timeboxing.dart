import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timebox/Controller/timeboxingcontroller.dart';
import 'package:timebox/Core/Constant/colors.dart';
import '../Widget/button.dart';

class TimeBoxing extends StatelessWidget {
  const TimeBoxing({super.key});

  @override
  Widget build(BuildContext context) {
    TimeBoxingControllerImp controller = Get.put(TimeBoxingControllerImp());
    return Scaffold(
        bottomNavigationBar: CustomButton(
          hint: "Result",
          onPressed: () {
            controller.validCheck();
          },
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: AppColor.secondaryColor,
          title: const Text(
            "Time Boxing",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: "Roboto",
            ),
          ),
        ),
        body: Column(children: [
          GetBuilder<TimeBoxingControllerImp>(
            builder: (controller) => Flexible(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: controller.time.length,
                itemBuilder: (context, index) => Form(
                  key: controller.formstate,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "can't be empty";
                              }
                              if (val.length > 2) {
                                return "can't be more than 15";
                              }
                              return null;
                            },
                            controller: controller.time[index],
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColor.secondaryColor)),
                              hintText: "Time",
                            ),
                          )),
                      const SizedBox(width: 10),
                      Expanded(
                          flex: 2,
                          child: TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "can't be empty";
                              }
                              if (val.length > 14) {
                                return "can't be more than 15";
                              }
                              return null;
                            },
                            controller: controller.oClock[index],
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColor.secondaryColor)),
                              hintText: "00",
                            ),
                          )),
                      const SizedBox(width: 10),
                      Expanded(
                          flex: 2,
                          child: TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "can't be empty";
                              }
                              if (val.length > 14) {
                                return "can't be more than 15";
                              }
                              return null;
                            },
                            controller: controller.halfHour[index],
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColor.secondaryColor)),
                              hintText: "30",
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.secondaryColor,
          child: const Icon(Icons.add),
          onPressed: () {
            controller.addTableRow();
          },
        ));
  }
}
