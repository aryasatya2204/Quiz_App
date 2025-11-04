import 'package:flutter/material.dart';
import 'package:quiz_app/core/app_colors.dart';
import 'package:quiz_app/widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // (Nantinya ini akan diatur oleh ThemeProvider)
    final bool isDarkMode = false;
    final Color textColor = isDarkMode ? AppColors.textDark : AppColors.textLight;

    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.backgroundDark : AppColors.backgroundLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Quiz Master',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Tantang pengetahuanmu dan jadilah master kuis!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 18,
                  color: textColor.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 48),

              // pengganti Login/Signup
              // Sesuai kriteria: "memasukkan nama"
              TextField(
                decoration: InputDecoration(
                    hintText: 'Masukkan Namamu',
                    filled: true,
                    fillColor: isDarkMode ? AppColors.cardDark : AppColors.cardLight,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    hintStyle: TextStyle(
                      fontFamily: 'Urbanist',
                      color: textColor.withOpacity(0.5),
                    )
                ),
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  color: textColor,
                ),
              ),
              const SizedBox(height: 24),

              // Menggunakan reusable widget
              CustomButton(
                text: 'Mulai Kuis',
                onPressed: () {
                  // Logika navigasi akan ditambahkan di modul berikutnya
                  print('Tombol Mulai Kuis Ditekan');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}