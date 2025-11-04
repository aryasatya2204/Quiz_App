import 'package:flutter/material.dart';
import 'package:quiz_app/screens/welcome_screen.dart';

import 'core/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Urbanist',
        scaffoldBackgroundColor: AppColors.backgroundLight,
      ),
      home: const WelcomeScreen(), // Mulai dari WelcomeScreen
    );
  }
}