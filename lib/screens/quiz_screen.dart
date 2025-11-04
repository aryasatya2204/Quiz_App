import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/providers/quiz_provider.dart';
import 'package:quiz_app/widgets/answer_option_card.dart';
import 'package:quiz_app/widgets/custom_button.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quizProvider = context.watch<QuizProvider>();
    final theme = Theme.of(context);

    final question = quizProvider.currentQuestion;
    final totalQuestions = quizProvider.totalQuestions;
    final currentQuestionIndex = quizProvider.currentQuestionIndex;

    return Scaffold(
      // AppBar otomatis mengambil style dari AppTheme
      appBar: AppBar(
        title: const Text('Quiz Flutter'),
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
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: (currentQuestionIndex + 1) / totalQuestions,
                minHeight: 10,
                backgroundColor: theme.colorScheme.surface,
                valueColor: AlwaysStoppedAnimation(theme.colorScheme.primary),
              ),
            ),
            const SizedBox(height: 32),

            Text(
              question.text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onBackground,
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
                if (quizProvider.selectedAnswerIndex != null) {
                  context.read<QuizProvider>().nextQuestion(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Silakan pilih satu jawaban!'),
                      backgroundColor: theme.colorScheme.error,
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