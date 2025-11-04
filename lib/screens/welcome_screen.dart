import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/config/app_routes.dart';
import 'package:quiz_app/providers/quiz_provider.dart';
import 'package:quiz_app/providers/theme_provider.dart';
import 'package:quiz_app/widgets/custom_button.dart';

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
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        // Konten dibungkus Center dan ConstrainedBox agar rapi di layar lebar (tablet)
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Switch(
                      value: theme.brightness == Brightness.dark,
                      onChanged: (value) {
                        context.read<ThemeProvider>().toggleTheme(value);
                      },
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Quiz Master',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onBackground,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Tantang pengetahuanmu dan jadilah master kuis!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 18,
                      color: theme.colorScheme.onBackground.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 48),
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      hintText: 'Masukkan Namamu',
                    ),
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      color: theme.colorScheme.onBackground,
                    ),
                  ),
                  const SizedBox(height: 24),
                  CustomButton(
                    text: 'Mulai Kuis',
                    onPressed: () {
                      final String playerName = _nameController.text;
                      if (playerName.trim().isNotEmpty) {
                        final quizProvider = context.read<QuizProvider>();
                        quizProvider.resetQuiz();
                        quizProvider.setPlayerName(playerName);

                        Navigator.pushNamed(context, AppRoutes.quiz);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Nama tidak boleh kosong!'),
                            backgroundColor: theme.colorScheme.error,
                          ),
                        );
                      }
                    },
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}