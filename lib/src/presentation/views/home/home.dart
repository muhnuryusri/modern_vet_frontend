import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modern_vet_submission/src/core/styles/custom_colors.dart';
import 'package:modern_vet_submission/src/core/styles/typography.dart';
import 'package:modern_vet_submission/src/presentation/components/custom_button.dart';
import 'package:modern_vet_submission/src/presentation/components/custom_item.dart';
import 'package:modern_vet_submission/src/presentation/components/empty_state.dart';
import 'package:modern_vet_submission/src/presentation/views/detail/controller/feedback_detail_binding.dart';
import 'package:modern_vet_submission/src/presentation/views/detail/feedback_detail.dart';
import 'package:modern_vet_submission/src/presentation/views/feedback/controller/feedback_formulir_binding.dart';
import 'package:modern_vet_submission/src/presentation/views/feedback/feedback_formulir.dart';
import 'package:modern_vet_submission/src/presentation/views/home/controller/home_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.text(
                  "Our reviews",
                  textStyle: CustomTextStyle.header,
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await controller.loadFeedbacks();
                    },
                    child: Obx(() {
                      if (controller.isLoading.value) {
                        return const Center(
                            child: CircularProgressIndicator(
                          color: CustomColors.primary,
                        ));
                      }

                      if (controller.errorMessage.value.isNotEmpty) {
                        return SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.7,
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText.text(
                                    "An error occurred, please try again",
                                    textStyle: CustomTextStyle.body()),
                                CustomText.text(controller.errorMessage.value),
                              ],
                            )),
                          ),
                        );
                      }

                      if (controller.feedbackList.isEmpty) {
                        return SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.7,
                            child: const Center(child: EmptyState()),
                          ),
                        );
                      }

                      return Padding(
                        padding: EdgeInsets.only(bottom: 50),
                        child: ListView.builder(
                          itemCount: controller.feedbackList.length,
                          itemBuilder: (context, index) {
                            final feedback = controller.feedbackList[index];
                            return CustomItem(
                              name: feedback.name,
                              petName: feedback.petName,
                              rating: feedback.rating,
                              onTap: () {
                                Get.to(
                                  () => FeedbackDetail(),
                                  arguments: {
                                    'feedbackId': feedback.id.toString()
                                  },
                                  binding: FeedbackDetailBinding(),
                                );
                              },
                            );
                          },
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(left: 26, right: 26, bottom: 30),
              child: CustomButton(
                title: "Submit a review",
                onPressed: () {
                  Get.to(FeedbackFormulir(),
                      binding: FeedbackFormulirBinding());
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
