import 'package:flutter/material.dart';
import 'package:quiz_app/screens/score_screen.dart';
import 'package:quiz_app/screens/welcome_screen.dart';
import 'package:quiz_app/screens/quiz_screen.dart';

class AppRoutes {
  static const String welcome = '/';
  static const String quiz = '/quiz';
  static const String score = '/score';

  static final Map<String, WidgetBuilder> routes = {
    welcome: (context) => const WelcomeScreen(),
    quiz: (context) => const QuizScreen(),
    score: (context) => const ScoreScreen(),
  };
}