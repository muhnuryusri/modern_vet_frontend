import 'package:modern_vet_submission/src/data/models/feedback_request.dart';
import 'package:modern_vet_submission/src/domain/entity/feedback_entity.dart';

abstract class FeedbackRepository {
  Future<FeedbackEntity> submitFeedback(FeedbackRequest feedback);
  Future<List<FeedbackEntity>> getFeedbacks();
  Future<FeedbackEntity> getFeedbackById(int id);
}
