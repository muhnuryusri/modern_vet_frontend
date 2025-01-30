import 'package:flutter/material.dart';
import 'package:modern_vet_submission/src/core/constants/image_constant.dart';
import 'package:modern_vet_submission/src/core/helpers/image_helper.dart';
import 'package:modern_vet_submission/src/core/styles/typography.dart';

class CustomItem extends StatelessWidget {
  final int rating;
  final String name;
  final String petName;
  final VoidCallback onTap;

  const CustomItem({
    super.key,
    required this.rating,
    required this.name,
    required this.petName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.all(5),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // rating/stars
              Row(
                children: List.generate(5, (index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 4),
                    child: ImageHelper.loadImage(
                      width: 30,
                      index < rating
                          ? ImageConstant.icFilledStar
                          : ImageConstant.icStar,
                    ),
                  );
                }),
              ),

              // name
              const SizedBox(height: 8),
              Row(
                children: [
                  ImageHelper.loadImage(width: 20, ImageConstant.icUser),
                  const SizedBox(width: 8),
                  CustomText.text(
                    name,
                    textStyle: CustomTextStyle.caption,
                  )
                ],
              ),

              // pet name
              const SizedBox(height: 4),
              Row(
                children: [
                  ImageHelper.loadImage(width: 20, ImageConstant.icPaw),
                  const SizedBox(width: 8),
                  CustomText.text(
                    petName,
                    textStyle: CustomTextStyle.caption,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
