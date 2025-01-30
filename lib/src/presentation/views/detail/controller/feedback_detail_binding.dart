import 'package:get/get.dart';
import 'package:modern_vet_submission/src/data/repository/feedback_repository_impl.dart';
import 'package:modern_vet_submission/src/domain/usecase/get_feedback_detail_usecase.dart';
import 'package:modern_vet_submission/src/presentation/views/detail/controller/feedback_detail_controller.dart';

class FeedbackDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => GetFeedbackDetailUsecase(Get.find<FeedbackRepositoryImpl>()),
    );

    Get.lazyPut<FeedbackDetailController>(
      () => FeedbackDetailController(feedbackDetail: Get.find()),
    );
  }
}
