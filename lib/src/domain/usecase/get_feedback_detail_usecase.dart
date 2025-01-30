import 'package:modern_vet_submission/src/domain/entity/feedback_entity.dart';
import 'package:modern_vet_submission/src/domain/repository/feedback_repository.dart';

class GetFeedbackDetailUsecase {
  final FeedbackRepository repository;

  GetFeedbackDetailUsecase(this.repository);

  Future<FeedbackEntity> call(int id) async {
    return await repository.getFeedbackById(id);
  }
}
