import 'package:flutter/material.dart';
import 'package:quiz_app/core/app_colors.dart';
import 'package:quiz_app/data/dummy_questions.dart';
import 'package:quiz_app/widgets/answer_option_card.dart';
import 'package:quiz_app/widgets/custom_button.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final question = dummyQuestions[0];
    const int currentQuestion = 1;
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
            // Progress
            Text(
              'Pertanyaan $currentQuestion dari $totalQuestions',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 8),
            // Linear Progress Indicator
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: currentQuestion / totalQuestions,
                minHeight: 10,
                backgroundColor: Colors.grey.shade300,
                valueColor: const AlwaysStoppedAnimation(AppColors.primary),
              ),
            ),
            const SizedBox(height: 32),

            // Teks Pertanyaan
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

            // Pilihan Jawaban
            ...List.generate(question.options.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: AnswerOptionCard(
                  optionText: question.options[index],
                  isSelected: index == 0,
                ),
              );
            }),

            const Spacer(),

            // Tombol Next
            CustomButton(
              text: 'Selanjutnya',
              onPressed: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}