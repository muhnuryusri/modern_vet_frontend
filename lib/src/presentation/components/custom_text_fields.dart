import 'package:flutter/material.dart';
import 'package:modern_vet_submission/src/core/styles/custom_colors.dart';
import 'package:modern_vet_submission/src/core/styles/typography.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final bool isRequired;
  final int maxLines;
  final Function(String) onChanged;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.onChanged,
    this.isRequired = false,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomText.text(label, textStyle: CustomTextStyle.body()),
            SizedBox(width: 3),
            isRequired
                ? CustomText.text(
                    "*",
                    textStyle: CustomTextStyle.body(color: CustomColors.red),
                  )
                : SizedBox(),
          ],
        ),
        SizedBox(height: 10),
        TextField(
          onChanged: onChanged,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: CustomTextStyle.placeholder,
            border: OutlineInputBorder(
              borderSide: BorderSide(),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: CustomColors.primary),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
