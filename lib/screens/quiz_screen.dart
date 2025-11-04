import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/providers/quiz_provider.dart';
import 'package:quiz_app/widgets/answer_option_card.dart';
import 'package:quiz_app/widgets/custom_button.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  // Widget helper untuk build opsi jawaban (menghindari duplikasi kode)
  Widget _buildAnswerOption(BuildContext context, QuizProvider quizProvider, Question question, int index) {
    return GestureDetector(
      onTap: () => context.read<QuizProvider>().selectAnswer(index),
      child: AnswerOptionCard(
        optionText: question.options[index],
        isSelected: quizProvider.selectedAnswerIndex == index,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final quizProvider = context.watch<QuizProvider>();
    final theme = Theme.of(context);

    final question = quizProvider.currentQuestion;
    final totalQuestions = quizProvider.totalQuestions;
    final currentQuestionIndex = quizProvider.currentQuestionIndex;

    return Scaffold(
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

            // Menggunakan Expanded + LayoutBuilder untuk layout adaptif
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Cek lebar parent
                  if (constraints.maxWidth > 600) {
                    // Tampilan Tablet: Grid 2 kolom
                    return GridView.builder(
                      itemCount: question.options.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 4 / 1, // Rasio lebar:tinggi
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                      ),
                      itemBuilder: (context, index) {
                        return _buildAnswerOption(context, quizProvider, question, index);
                      },
                    );
                  } else {
                    // Tampilan HP: List 1 kolom
                    return ListView.builder(
                      itemCount: question.options.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: _buildAnswerOption(context, quizProvider, question, index),
                        );
                      },
                    );
                  }
                },
              ),
            ),

            // const Spacer(), // Dihapus karena sudah diganti Expanded
            const SizedBox(height: 24), // Padding sebelum tombol

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