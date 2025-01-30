import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modern_vet_submission/src/core/constants/image_constant.dart';
import 'package:modern_vet_submission/src/core/helpers/image_helper.dart';
import 'package:modern_vet_submission/src/core/styles/typography.dart';
import 'package:modern_vet_submission/src/presentation/components/custom_app_bar.dart';
import 'package:modern_vet_submission/src/presentation/components/custom_button.dart';
import 'package:modern_vet_submission/src/presentation/components/custom_text_fields.dart';
import 'package:modern_vet_submission/src/presentation/views/feedback/controller/feedback_formulir_controller.dart';

class FeedbackFormulir extends StatelessWidget {
  const FeedbackFormulir({super.key});

  @override
  Widget build(BuildContext context) {
    final FeedbackFormulirController controller = Get.find();
    return Scaffold(
      appBar: CustomAppBar(
        onBackPressed: Get.back,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.text(
                "Rating",
                textStyle: CustomTextStyle.header,
              ),

              // rating/stars
              const SizedBox(height: 25),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    5,
                    (index) {
                      return InkWell(
                        splashFactory: NoSplash.splashFactory,
                        child: ImageHelper.loadImage(
                            width: 30,
                            index < controller.selectedRating.value
                                ? ImageConstant.icFilledStar
                                : ImageConstant.icStar),
                        onTap: () {
                          controller.updateRating(index + 1);
                        },
                      );
                    },
                  ),
                ),
              ),

              // form
              const SizedBox(height: 35),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: "Name",
                      hint: "Your Name",
                      onChanged: (value) => controller.name.value = value,
                      isRequired: true,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomTextField(
                      label: "Pets name",
                      hint: "Pets Name",
                      onChanged: (value) => controller.petName.value = value,
                      isRequired: true,
                    ),
                  )
                ],
              ),

              const SizedBox(height: 25),
              CustomTextField(
                label: "Comment (optional)",
                hint: "Any additional comments and much appreciated!",
                maxLines: 10,
                onChanged: (value) => controller.comments.value = value,
              ),

              const SizedBox(height: 25),
              Obx(
                () => CustomButton(
                  title: "Submit",
                  isLoading: controller.isLoading.value,
                  onPressed: () async {
                    if (controller.validateForm()) {
                      await controller.submitNewFeedback();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
