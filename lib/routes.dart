import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timebox/Core/Constant/routes.dart';
import 'package:timebox/View/Screen/braindump.dart';
import 'package:timebox/View/Screen/toppriorities.dart';

import 'View/Screen/timeboxing.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const BrainDump()),
  GetPage(name: AppRoutes.topPriorities, page: () => const TopPriorities()),
  GetPage(name: AppRoutes.timeBoxing, page: () => const TimeBoxing()),
];
