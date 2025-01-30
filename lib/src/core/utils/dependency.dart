import 'package:get/get.dart';
import 'package:modern_vet_submission/src/data/repository/feedback_repository_impl.dart';
import 'package:modern_vet_submission/src/data/services/api_client.dart';
import 'package:modern_vet_submission/src/data/services/api_service.dart';

class DependencyCreator {
  static init() {
    Get.lazyPut<ApiClient>(() => ApiClient());
    Get.lazyPut<ApiService>(() => ApiService(client: Get.find<ApiClient>()));
    Get.lazyPut<FeedbackRepositoryImpl>(
        () => FeedbackRepositoryImpl(apiService: Get.find<ApiService>()));
  }
}
