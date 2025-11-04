import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:quiz_app/providers/theme_provider.dart';
import 'package:quiz_app/core/app_theme.dart';
import 'package:quiz_app/config/app_routes.dart';
import 'package:quiz_app/providers/quiz_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => QuizProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,

      // 6. Atur properti tema
      themeMode: themeProvider.themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,

      initialRoute: AppRoutes.welcome,
      routes: AppRoutes.routes,
    );
  }
}