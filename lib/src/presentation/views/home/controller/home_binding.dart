import 'package:get/get.dart';
import 'package:modern_vet_submission/src/data/repository/feedback_repository_impl.dart';
import 'package:modern_vet_submission/src/domain/usecase/get_feedbacks_usecase.dart';
import 'package:modern_vet_submission/src/presentation/views/home/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => GetFeedbacksUsecase(Get.find<FeedbackRepositoryImpl>()),
    );

    Get.lazyPut<HomeController>(
      () => HomeController(getFeedbacks: Get.find()),
    );
  }
}
