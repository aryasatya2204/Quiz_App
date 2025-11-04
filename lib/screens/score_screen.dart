import 'package:flutter/material.dart';
import 'package:quiz_app/core/app_colors.dart';
import 'package:quiz_app/widgets/custom_button.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Data skor statis
    const int score = 8;
    const int totalQuestions = 10;
    const String playerName = "User";

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

              // Tampilan Skor
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

              // Tombol Main Lagi
              CustomButton(
                text: 'Main Lagi',
                onPressed: () {
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}