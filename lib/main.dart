import 'package:e_commerce/theme.dart';
import 'package:e_commerce/ui/screens/app_layout/app_layout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppLayout(),
      theme: AppTheme.myTheme,
    );
  }
}
