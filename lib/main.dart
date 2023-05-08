import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timebox/View/Screen/toppriorities.dart';
import 'package:timebox/routes.dart';

import 'Core/Constant/colors.dart';
import 'View/Screen/braindump.dart';
import 'View/Screen/timeboxing.dart';
import 'View/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: AppColor.primaryColor,
          fontFamily: "Roboto",
          textTheme: const TextTheme(
              headlineLarge: TextStyle(
            fontSize: 25,
            color: Colors.amberAccent,
          ))),
      getPages: routes,
    );
  }
}
