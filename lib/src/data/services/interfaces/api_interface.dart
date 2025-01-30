import '../../models/feedback_model.dart';

abstract class ApiInterface {
  Future<FeedbackModel> submitFeedback(FeedbackModel feedback);
  Future<List<FeedbackModel>> getFeedbacks();
  Future<FeedbackModel> getFeedbackById(int id);
}
