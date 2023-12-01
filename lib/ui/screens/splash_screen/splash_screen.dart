import 'dart:async';

import 'package:e_commerce/ui/screens/login_screen/login_screen.dart';
import 'package:e_commerce/utils/assets/images.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImages.splashScreen);
  }
}
