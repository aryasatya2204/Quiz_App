import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/config/app_routes.dart';
import 'package:quiz_app/core/app_colors.dart';
import 'package:quiz_app/providers/quiz_provider.dart';
import 'package:quiz_app/widgets/answer_option_card.dart';
import 'package:quiz_app/widgets/custom_button.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quizProvider = context.watch<QuizProvider>();

    final question = quizProvider.currentQuestion;
    final totalQuestions = quizProvider.totalQuestions;
    final currentQuestionIndex = quizProvider.currentQuestionIndex;

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
              'Pertanyaan ${currentQuestionIndex + 1} dari $totalQuestions',
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
                value: (currentQuestionIndex + 1) / totalQuestions,
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
                  onTap: () => context.read<QuizProvider>().selectAnswer(index),
                  child: AnswerOptionCard(
                    optionText: question.options[index],
                    isSelected: quizProvider.selectedAnswerIndex == index,
                  ),
                ),
              );
            }),

            const Spacer(),

            CustomButton(
              text: quizProvider.isLastQuestion ? 'Selesai' : 'Selanjutnya',
              onPressed: () {
                // Validasi harus dilakukan di sini sebelum memanggil provider.
                if (quizProvider.selectedAnswerIndex != null) {
                  context.read<QuizProvider>().nextQuestion(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Silakan pilih satu jawaban!'),
                      backgroundColor: AppColors.incorrect,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}