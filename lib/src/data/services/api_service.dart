import 'package:dio/dio.dart';
import 'package:modern_vet_submission/src/data/models/feedback_request.dart';
import 'package:modern_vet_submission/src/data/services/api_client.dart';
import '../models/feedback_model.dart';

class ApiService {
  final ApiClient _client;

  ApiService({required ApiClient client}) : _client = client;

  Future<FeedbackModel> submitFeedback(FeedbackRequest feedback) async {
    try {
      final response = await _client.post(
        '/feedback',
        feedback.toJson(),
      );
      return FeedbackModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<List<FeedbackModel>> getAllFeedback() async {
    final response = await _client.get('/feedback');
    return (response.data['feedbacks'] as List)
        .map((json) => FeedbackModel.fromJson(json))
        .toList();
  }

  Future<FeedbackModel> getFeedbackById(int id) async {
    try {
      final response = await _client.get('/feedback/$id');
      return FeedbackModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  dynamic _handleDioError(DioException error) {
    if (error.response != null) {
      throw HttpException(
        statusCode: error.response!.statusCode,
        message: error.response!.data['error'] ?? 'Unknown error',
      );
    }
    throw const HttpException(message: 'No internet connection');
  }
}

class HttpException implements Exception {
  final int? statusCode;
  final String message;

  const HttpException({
    this.statusCode,
    required this.message,
  });
}
