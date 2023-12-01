import 'package:e_commerce/utils/assets/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData myTheme = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: AppColor.whiteColor,
    canvasColor: AppColor.primaryColor,
    bottomAppBarTheme: BottomAppBarTheme(
      color: AppColor.primaryColor,
    ),
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
      ),
      labelSmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: AppColor.primaryDarkColor,
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: AppColor.primaryColor,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColor.primaryDarkColor,
      ),
    ),
    dividerTheme: DividerThemeData(color: AppColor.primaryColor),
  );
}
