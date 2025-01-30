import 'package:get/get.dart';
import 'package:modern_vet_submission/src/domain/entity/feedback_entity.dart';
import 'package:modern_vet_submission/src/domain/usecase/get_feedback_detail_usecase.dart';

class FeedbackDetailController extends GetxController {
  final GetFeedbackDetailUsecase feedbackDetail;
  FeedbackDetailController({required this.feedbackDetail});

  final feedback = Rxn<FeedbackEntity>();
  final isLoading = true.obs;
  final errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    final feedbackId = Get.arguments['feedbackId'];
    if (feedbackId != null) {
      getFeedbackDetail(feedbackId);
    } else {
      errorMessage.value = 'Feedback ID is missing';
    }
  }

  Future<void> getFeedbackDetail(String id) async {
    try {
      isLoading.value = true;
      final result = await feedbackDetail(int.parse(id));
      ;
      feedback.value = result;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
