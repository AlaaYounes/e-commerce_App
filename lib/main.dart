import 'package:e_commerce/theme.dart';
import 'package:e_commerce/ui/screens/splash_screen/splash_screen.dart';
import 'package:e_commerce/utils/my_blocObserver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
  Bloc.observer = MyBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: AppTheme.myTheme,
    );
  }
}
