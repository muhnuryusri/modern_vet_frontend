import 'package:get/get.dart';
import 'package:modern_vet_submission/src/domain/entity/feedback_entity.dart';
import 'package:modern_vet_submission/src/domain/usecase/get_feedbacks_usecase.dart';

class HomeController extends GetxController {
  final GetFeedbacksUsecase getFeedbacks;
  HomeController({required this.getFeedbacks});

  final feedbackList = <FeedbackEntity>[].obs;
  final isLoading = false.obs;
  final errorMessage = ''.obs;

  @override
  void onInit() async {
    loadFeedbacks();
    super.onInit();
  }

  @override
  void onReady() {
    loadFeedbacks();
    super.onReady();
  }

  Future<void> loadFeedbacks() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final feedbacks = await getFeedbacks();
      feedbackList.assignAll(feedbacks);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
