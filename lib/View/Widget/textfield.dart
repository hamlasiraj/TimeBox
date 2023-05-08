import 'package:flutter/material.dart';
import 'package:timebox/Core/Constant/colors.dart';

class CusttomTextField extends StatelessWidget {
  final String hintText;
  final int? maxLines;
  final TextEditingController controller;
  const CusttomTextField({
    super.key,
    required this.hintText,
    this.maxLines,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: TextField(
          controller: controller,
          textAlign: TextAlign.start,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColor.secondaryColor)),
            hintText: hintText,
            focusColor: AppColor.secondaryColor,
          ),
          maxLines: maxLines,
        ));
  }
}
