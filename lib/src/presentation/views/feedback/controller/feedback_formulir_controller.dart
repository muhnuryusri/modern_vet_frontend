import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modern_vet_submission/src/core/constants/image_constant.dart';
import 'package:modern_vet_submission/src/core/styles/custom_colors.dart';
import 'package:modern_vet_submission/src/data/models/feedback_request.dart';
import 'package:modern_vet_submission/src/domain/entity/feedback_entity.dart';
import 'package:modern_vet_submission/src/domain/usecase/submit_feedback_usecase.dart';
import 'package:modern_vet_submission/src/presentation/components/custom_dialog.dart';
import 'package:modern_vet_submission/src/presentation/views/home/controller/home_controller.dart';

class FeedbackFormulirController extends GetxController {
  final SubmitFeedbackUsecase submitFeedback;
  FeedbackFormulirController({required this.submitFeedback});

  final name = ''.obs;
  final petName = ''.obs;
  final selectedRating = 0.obs;
  final comments = ''.obs;

  final feedbackList = <FeedbackEntity>[].obs;
  final isLoading = false.obs;
  final errorMessage = ''.obs;

  void updateRating(int rating) {
    selectedRating.value = rating;
  }

  bool validateForm() {
    if (name.value.isEmpty ||
        petName.value.isEmpty ||
        selectedRating.value == 0) {
      Get.snackbar(
        'Error',
        'Please fill all required fields',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: CustomColors.red.withValues(alpha: 0.8),
        colorText: CustomColors.background,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      );
      return false;
    }
    return true;
  }

  Future<void> submitNewFeedback() async {
    try {
      isLoading.value = true;

      final feedback = FeedbackRequest(
        name: name.value,
        petName: petName.value,
        rating: selectedRating.value,
        comments: comments.value.isNotEmpty ? comments.value : "",
      );

      await submitFeedback(feedback);

      Get.dialog(
        CustomDialog(
          icon: ImageConstant.icSuccess,
          message: 'Feedback submitted',
          buttonText: 'Return To Home',
          onPressed: () {
            Get.close(2);
            Get.find<HomeController>().loadFeedbacks();
          },
        ),
        barrierDismissible: false,
      );
    } catch (e) {
      Get.dialog(
        CustomDialog(
          icon: ImageConstant.icError,
          message: 'An error occurred, please re-submit',
          buttonText: 'Close',
          onPressed: () {
            Get.back();
          },
        ),
        barrierDismissible: false,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
