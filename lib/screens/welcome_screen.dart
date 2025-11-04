import 'package:flutter/material.dart';
import 'package:quiz_app/core/app_colors.dart';
import 'package:quiz_app/widgets/custom_button.dart';
import 'package:quiz_app/config/app_routes.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

              TextField(
                controller: _nameController,
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

              CustomButton(
                text: 'Mulai Kuis',
                onPressed: () {
                  final String playerName = _nameController.text;
                  if (playerName.isNotEmpty) {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.quiz,
                      arguments: playerName,
                    );
                  } else {
                    // Tampilkan pesan error jika nama kosong
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Nama tidak boleh kosong!'),
                        backgroundColor: AppColors.incorrect,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}