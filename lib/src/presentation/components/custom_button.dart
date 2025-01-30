import 'package:flutter/material.dart';
import 'package:modern_vet_submission/src/core/styles/custom_colors.dart';
import 'package:modern_vet_submission/src/core/styles/typography.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final VoidCallback onPressed;
  const CustomButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(letterSpacing: 0),
          padding: EdgeInsets.all(10),
          backgroundColor: CustomColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: CustomColors.background,
                    color: CustomColors.primary,
                  ),
                )
              : CustomText.text(
                  title,
                  textStyle: CustomTextStyle.button,
                ),
        ),
      ),
    );
  }
}
