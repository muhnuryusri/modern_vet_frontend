import 'package:dio/dio.dart';
import 'package:modern_vet_submission/src/data/models/feedback_request.dart';
import 'package:modern_vet_submission/src/data/services/api_exception.dart';
import 'package:modern_vet_submission/src/data/services/api_service.dart';
import 'package:modern_vet_submission/src/domain/entity/feedback_entity.dart';
import 'package:modern_vet_submission/src/domain/repository/feedback_repository.dart';

class FeedbackRepositoryImpl implements FeedbackRepository {
  final ApiService apiService;

  FeedbackRepositoryImpl({required this.apiService});

  @override
  Future<FeedbackEntity> submitFeedback(FeedbackRequest feedback) async {
    try {
      final response = await apiService.submitFeedback(
        FeedbackRequest(
          name: feedback.name,
          petName: feedback.petName,
          rating: feedback.rating,
          comments: feedback.comments,
        ),
      );
      return FeedbackEntity(
        id: response.id,
        name: response.name,
        petName: response.petName,
        rating: response.rating,
        comments: response.comments ?? "",
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<List<FeedbackEntity>> getFeedbacks() async {
    try {
      final response = await apiService.getAllFeedback();
      return response
          .map((model) => FeedbackEntity(
                id: model.id,
                name: model.name,
                petName: model.petName,
                rating: model.rating,
                comments: model.comments ?? "",
              ))
          .toList();
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<FeedbackEntity> getFeedbackById(int id) async {
    try {
      final response = await apiService.getFeedbackById(id);
      return FeedbackEntity(
        id: id,
        name: response.name,
        petName: response.petName,
        rating: response.rating,
        comments: response.comments ?? "",
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  ApiException _handleDioError(DioException e) {
    if (e.response != null) {
      final statusCode = e.response!.statusCode;
      final message = e.response!.data['error'] ?? 'Unknown error occurred';

      switch (statusCode) {
        case 400:
          return BadRequestException(message: message);
        case 404:
          return NotFoundException(message: message);
        case 500:
          return ServerException(message: message);
        default:
          return ApiException(message: message, statusCode: statusCode);
      }
    }
    return ApiException(message: 'No internet connection');
  }
}
