import 'package:flutter/material.dart';
import 'package:quiz_app/core/app_colors.dart';

class AnswerOptionCard extends StatelessWidget {
  final String optionText;
  final bool isSelected;

  const AnswerOptionCard({
    Key? key,
    required this.optionText,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color borderColor = isSelected ? AppColors.primary : Colors.grey.shade300;
    Color backgroundColor = isSelected ? AppColors.primary.withOpacity(0.1) : AppColors.cardLight;

    return Card(
      elevation: 0,
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: borderColor, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              optionText,
              style: const TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            // Ikon centang
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: AppColors.primary,
              ),
          ],
        ),
      ),
    );
  }
}