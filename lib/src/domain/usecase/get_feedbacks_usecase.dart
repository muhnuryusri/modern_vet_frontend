import 'package:modern_vet_submission/src/domain/entity/feedback_entity.dart';
import 'package:modern_vet_submission/src/domain/repository/feedback_repository.dart';

class GetFeedbacksUsecase {
  final FeedbackRepository repository;

  GetFeedbacksUsecase(this.repository);

  Future<List<FeedbackEntity>> call() async {
    return await repository.getFeedbacks();
  }
}
