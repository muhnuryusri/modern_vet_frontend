import 'package:get/get.dart';
import 'package:modern_vet_submission/src/data/repository/feedback_repository_impl.dart';
import 'package:modern_vet_submission/src/domain/usecase/submit_feedback_usecase.dart';
import 'package:modern_vet_submission/src/presentation/views/feedback/controller/feedback_formulir_controller.dart';

class FeedbackFormulirBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SubmitFeedbackUsecase(Get.find<FeedbackRepositoryImpl>()),
    );

    Get.lazyPut<FeedbackFormulirController>(
      () => FeedbackFormulirController(submitFeedback: Get.find()),
    );
  }
}
