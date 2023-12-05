import 'package:e_commerce/utils/assets/colors.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  var controller = TextEditingController();
  String hintText;
  bool isPassword;
  TextInputType keyboardType;
  Widget? suffix;

  CustomFormField(
      {super.key,
      required this.controller,
      this.hintText = '',
      this.isPassword = false,
      this.keyboardType = TextInputType.text,
      this.suffix});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: AppColor.whiteColor,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        suffixIcon: suffix,
      ),
    );
  }
}
