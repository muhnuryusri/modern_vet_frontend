import 'package:flutter/material.dart';
import 'package:modern_vet_submission/src/core/styles/typography.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText.text(
            "No reviews yet",
            textStyle: CustomTextStyle.body(),
          ),
          CustomText.text(
            "Be the first by clicking the button below!",
            textStyle: CustomTextStyle.caption,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
