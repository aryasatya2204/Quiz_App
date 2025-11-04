import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/config/app_routes.dart';
import 'package:quiz_app/core/app_colors.dart';
import 'package:quiz_app/providers/quiz_provider.dart';
import 'package:quiz_app/widgets/custom_button.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quizProvider = context.watch<QuizProvider>();
    final int score = quizProvider.score;
    final int totalQuestions = quizProvider.totalQuestions;
    final String playerName = quizProvider.playerName ?? 'Pemain';

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Kuis Selesai, $playerName!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Skor Akhir Kamu',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 18,
                  color: Colors.grey.shade700,
                ),
              ),
              const SizedBox(height: 24),

              Text(
                '$score/$totalQuestions',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 48),

              CustomButton(
                text: 'Main Lagi',
                onPressed: () {
                  //akan mereset histori navigasi dan kembali ke awal.
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.welcome,
                        (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}