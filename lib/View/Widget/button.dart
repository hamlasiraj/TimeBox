import 'package:flutter/material.dart';
import '../../../Core/Constant/colors.dart';

class CustomButton extends StatelessWidget {
  final String hint;
  final void Function()? onPressed;
  const CustomButton({super.key, required this.hint, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      height: 40,
      child: MaterialButton(
        onPressed: onPressed,
        textColor: Colors.white,
        color: AppColor.secondaryColor,
        child: Text(
          hint,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto",
          ),
        ),
      ),
    );
  }
}
