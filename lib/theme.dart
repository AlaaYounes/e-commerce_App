import 'package:e_commerce/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData myTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.primaryColor,
    textTheme: TextTheme(
        bodyLarge: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 24,
          color: AppColor.whiteColor,
        ),
        bodyMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColor.whiteColor,
        ),
        bodySmall: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 16,
          color: AppColor.whiteColor,
        ),
        labelMedium: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 24,
          color: AppColor.primaryColor,
        )),
  );
}
