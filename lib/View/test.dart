import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Widget/button.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          CustomButton(
            hint: "HIIIIII",
            onPressed: () {},
          ),
          Table(
            border: TableBorder.all(color: Colors.black, width: 1.5),
            columnWidths: const {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(3),
              2: FlexColumnWidth(3),
            },
            children: [
              TableRow(children: [
                Text(
                  "1",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "Mohit",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "25",
                  style: TextStyle(fontSize: 15.0),
                ),
              ]),
            ],
          ),
        ],
      ),
    ));
  }
}
