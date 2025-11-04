import 'package:flutter/material.dart';
import 'package:quiz_app/config/app_routes.dart';
import 'package:quiz_app/data/dummy_questions.dart';
import 'package:quiz_app/models/question_model.dart';

class QuizProvider extends ChangeNotifier {
  String? playerName;
  final List<Question> _questions = dummyQuestions;
  int _currentQuestionIndex = 0;
  int? _selectedAnswerIndex;
  int _score = 0;

  int get currentQuestionIndex => _currentQuestionIndex;
  int get totalQuestions => _questions.length;
  int get score => _score;
  int? get selectedAnswerIndex => _selectedAnswerIndex;
  Question get currentQuestion => _questions[_currentQuestionIndex];
  bool get isLastQuestion => _currentQuestionIndex == _questions.length - 1;

  void setPlayerName(String name) {
    playerName = name;
  }

  void selectAnswer(int index) {
    _selectedAnswerIndex = index;
    notifyListeners();
  }

  void nextQuestion(BuildContext context) {
    if (_selectedAnswerIndex == currentQuestion.correctAnswerIndex) {
      _score++;
    }

    if (!isLastQuestion) {
      _currentQuestionIndex++;
      _selectedAnswerIndex = null;
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.score);
    }
    notifyListeners();
  }

  void resetQuiz() {
    _currentQuestionIndex = 0;
    _selectedAnswerIndex = null;
    _score = 0;
    playerName = null;
  }
}