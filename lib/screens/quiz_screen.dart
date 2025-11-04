import 'package:flutter/material.dart';
import 'package:quiz_app/core/app_colors.dart';
import 'package:quiz_app/data/dummy_questions.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/widgets/answer_option_card.dart';
import 'package:quiz_app/widgets/custom_button.dart';
import 'package:quiz_app/config/app_routes.dart';


class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();

}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int? _selectedAnswerIndex;
  int _score = 0;
  String? playerName;

  void _selectAnswer(int index) {
    setState(() {
      _selectedAnswerIndex = index;
    });
  }

  void _nextQuestion() {
    if (_selectedAnswerIndex != null) {
      final Question currentQuestion = dummyQuestions[_currentQuestionIndex];
      if (_selectedAnswerIndex == currentQuestion.correctAnswerIndex) {
        _score++;
      }

      if (_currentQuestionIndex < dummyQuestions.length - 1) {
        // Pindah ke pertanyaan berikutnya
        setState(() {
          _currentQuestionIndex++;
          _selectedAnswerIndex = null; // Reset pilihan
        });
      } else {
        Navigator.pushReplacementNamed(
            context,
            AppRoutes.score, // <-- Ganti ini
            arguments: {
              'score': _score,
              'totalQuestions': dummyQuestions.length,
              'playerName': playerName,
            },
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Silakan pilih satu jawaban!'),
          backgroundColor: AppColors.incorrect,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final String playerName = ModalRoute.of(context)!.settings.arguments as String;
    final Question question = dummyQuestions[_currentQuestionIndex];
    final int totalQuestions = dummyQuestions.length;

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text(
          'Quiz Flutter',
          style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.backgroundLight,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Pertanyaan ${_currentQuestionIndex + 1} dari $totalQuestions',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: (_currentQuestionIndex + 1) / totalQuestions,
                minHeight: 10,
                backgroundColor: Colors.grey.shade300,
                valueColor: const AlwaysStoppedAnimation(AppColors.primary),
              ),
            ),
            const SizedBox(height: 32),

            Text(
              question.text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),

            ...List.generate(question.options.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: GestureDetector(
                  onTap: () => _selectAnswer(index),
                  child: AnswerOptionCard(
                    optionText: question.options[index],
                    isSelected: _selectedAnswerIndex == index,
                  ),
                ),
              );
            }),

            const Spacer(),

            CustomButton(
              text: (_currentQuestionIndex == totalQuestions - 1) ? 'Selesai' : 'Selanjutnya',
              onPressed: _nextQuestion,
            ),
          ],
        ),
      ),
    );
  }
}