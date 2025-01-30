import 'package:flutter/material.dart';
import 'package:modern_vet_submission/src/core/helpers/image_helper.dart';
import 'package:modern_vet_submission/src/core/styles/typography.dart';
import 'package:modern_vet_submission/src/presentation/components/custom_button.dart';

class CustomDialog extends StatelessWidget {
  final String icon;
  final String message;
  final String buttonText;
  final VoidCallback onPressed;

  const CustomDialog({
    super.key,
    required this.icon,
    required this.message,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImageHelper.loadImage(icon),
            const SizedBox(height: 16),
            CustomText.text(message, textAlign: TextAlign.center),
            const SizedBox(height: 35),
            CustomButton(title: buttonText, onPressed: onPressed)
          ],
        ),
      ),
    );
  }
}
