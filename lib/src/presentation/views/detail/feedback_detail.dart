import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modern_vet_submission/src/core/constants/image_constant.dart';
import 'package:modern_vet_submission/src/core/helpers/image_helper.dart';
import 'package:modern_vet_submission/src/core/styles/custom_colors.dart';
import 'package:modern_vet_submission/src/core/styles/typography.dart';
import 'package:modern_vet_submission/src/presentation/components/custom_app_bar.dart';
import 'package:modern_vet_submission/src/presentation/views/detail/controller/feedback_detail_controller.dart';

class FeedbackDetail extends StatelessWidget {
  const FeedbackDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final FeedbackDetailController controller = Get.find();

    return Scaffold(
      appBar: CustomAppBar(
        onBackPressed: Get.back,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
              child: CircularProgressIndicator(
            color: CustomColors.primary,
          ));
        }

        if (controller.errorMessage.value.isNotEmpty) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText.text("An error occurred, please try again",
                  textStyle: CustomTextStyle.body()),
              CustomText.text(controller.errorMessage.value),
            ],
          ));
        }

        final feedback = controller.feedback.value;
        if (feedback == null) {
          return const Center(child: Text('Feedback not found'));
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.text(
                "${feedback.name}'s reviews",
                textStyle: CustomTextStyle.header,
              ),

              // Rating stars
              const SizedBox(height: 42),
              Row(
                children: List.generate(
                  5,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: ImageHelper.loadImage(
                      width: 30,
                      index < feedback.rating
                          ? ImageConstant.icFilledStar
                          : ImageConstant.icStar,
                    ),
                  ),
                ),
              ),

              // Pet name
              const SizedBox(height: 20),
              Row(
                children: [
                  ImageHelper.loadImage(width: 20, ImageConstant.icPaw),
                  const SizedBox(width: 8),
                  CustomText.text(
                    feedback.petName,
                    textStyle: CustomTextStyle.caption,
                  ),
                ],
              ),

              // Comments
              const SizedBox(height: 25),
              if (feedback.comments != null)
                CustomText.text(
                  feedback.comments!,
                  textStyle: CustomTextStyle.caption,
                ),
            ],
          ),
        );
      }),
    );
  }
}
