import 'package:modern_vet_submission/src/data/models/feedback_request.dart';
import 'package:modern_vet_submission/src/domain/entity/feedback_entity.dart';
import 'package:modern_vet_submission/src/domain/repository/feedback_repository.dart';

class SubmitFeedbackUsecase {
  final FeedbackRepository repository;

  SubmitFeedbackUsecase(this.repository);

  Future<FeedbackEntity> call(FeedbackRequest feedback) async {
    return await repository.submitFeedback(feedback);
  }
}
