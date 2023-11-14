import 'package:e_commerce/colors.dart';
import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  var controller = TextEditingController();
  String hintText;
  bool isPassword;
  TextInputType keyboardType;
  Widget? suffix;

  DefaultFormField(
      {required this.controller,
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
