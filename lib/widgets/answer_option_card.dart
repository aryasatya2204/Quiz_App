import 'package:flutter/material.dart';

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
    final theme = Theme.of(context);

    Color borderColor = isSelected
        ? theme.colorScheme.primary
        : theme.dividerColor.withOpacity(0.5);
    Color backgroundColor = isSelected
        ? theme.colorScheme.primary.withOpacity(0.1)
        : theme.colorScheme.surface;

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
            Expanded( // Expanded membantu text wrap jika panjang
              child: Text(
                optionText,
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: theme.colorScheme.primary,
              ),
          ],
        ),
      ),
    );
  }
}